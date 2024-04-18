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

    $full_name = htmlspecialchars($_POST['full_name'], ENT_QUOTES);
    $username = preg_replace("/[^a-zA-Z0-9_-]/", "", $_POST['username']);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
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

    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];

    $action = $authCtrl->getUser($email, $password);

    $_SESSION['username'] = $action[0]['username'];
    $_SESSION['user_id'] = $action[0]['id'];
    $type = $action[0]['role'];

    if ($type == 'student') {
        header("location: ../index.php?error=none");
        exit();
    } else {
        header("location: ../admin/index.php?error=none");
        exit();
    }
}
