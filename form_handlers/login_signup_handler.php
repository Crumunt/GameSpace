<?php

session_start();

require "../classes/dbh.php";
require "../classes/model/authenticationModel.php";
require "../classes/controller/authenticationCtrl.php";
require "../classes/view/authView.php";

$authView = new Authview();
$authCtrl = new AuthenticationCtrl();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['register'])) {
        registerUser($authCtrl);
    } elseif (isset($_POST['login'])) {
        loginUser($authCtrl);
    }
}
if($_SERVER['REQUEST_METHOD'] == 'GET') {
    if(isset($_GET['user_email'])) {
        checkEmail($authView);
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
    $_SESSION['email'] = $action[2];

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
    $_SESSION['email'] = $action[0]['email'];
    $_SESSION['user_type'] = $action[0]['role'];
    $type = $action[0]['role'];

    if ($type == 'student') {
        echo 'index.php';
        exit();
    } else {
        // header("location: ../admin/index.php?error=none");
        echo 'admin/index.php';
        exit();
    }
}

function checkEmail($authView) {

    $user_email = $_GET['user_email'];

    $action = $authView->fetchUserEmail($user_email);

    if(count($action) > 0) {
        echo "error";
    }

}
