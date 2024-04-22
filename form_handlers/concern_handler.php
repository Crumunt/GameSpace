<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require "../vendor/autoload.php";

session_start();
include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/controller/userCtrl.php";

$userCtrl = new UserCtrl();
$mail = new PHPMailer();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['send_concern'])) {
        sendConcern($userCtrl);
        sendMail($mail);
    }
}

function sendConcern($userCtrl)
{

    $user_id = $_SESSION['user_id'];
    $concern_header = htmlspecialchars($_POST['concern_header'], ENT_QUOTES);
    $concern_body = htmlspecialchars($_POST['concern_body'], ENT_QUOTES);

    try {
        $userCtrl->submitConcern($concern_header, $concern_body, $user_id);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}

function sendMail($mail)
{
    $customer_email = $_SESSION['email'];
    $concern_header = htmlspecialchars($_POST['concern_header'], ENT_QUOTES);

    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'lorenz.bocatot@clsu2.edu.ph';
        $mail->Password = 'unncxswdjgskszks ';
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;

        $mail->setFrom('lorenz.bocatot@clsu2.edu.ph');
        $mail->addAddress($customer_email);

        $mail->isHTML(true);

        $mail->Subject = "GameSpace: $concern_header";
        $mail->Body = "This email confirms that your concern has been received by the staff and is being addressed immediately!";

        $mail->send();
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}
