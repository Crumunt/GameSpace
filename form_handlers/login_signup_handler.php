<?php

session_start();

require "../classes/dbh.php";
require "../classes/model/authenticationModel.php";
require "../classes/controller/authenticationCtrl.php";

$authCtrl = new AuthenticationCtrl();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['register'])) {
        registerUser($authCtrl);
    } elseif (isset($_POST['login'])) {
        loginUser($authCtrl);
    }
}

function registerUser($authCtrl)
{

    $full_name = $_POST['full_name'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $action = $authCtrl->addUser($full_name, $username, $email, $password);

    $_SESSION['username'] = $action[0];
    $_SESSION['user_id'] = $action[1];

    header("location: ../index.php");
    exit();
}

function checkEmptyInputs()
{

    foreach ($_POST as $name => $value) {

        if ($value == '') {
            header("location: ../signup.php?error=MissingFields");
            exit();
        }
    }
}

function loginUser($authCtrl)
{

    $email = $_POST['email'];
    $password = $_POST['password'];

    $action = $authCtrl->getUser($email, $password);

    $_SESSION['username'] = $action[0]['username'];
    $_SESSION['user_id'] = $action[0]['id'];

    header("location: ../index.php?error=none");
    exit();

}
