<?php
session_start();
require "../classes/dbh.php";
require "../classes/model/userModel.php";
require "../classes/controller/userCtrl.php";
require "../classes/view/userView.php";


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require "../vendor/autoload.php";

$mail = new PHPMailer();

$userCtrl = new UserCtrl();
$userView = new UserView();

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    if (isset($_POST['add_to_cart'])) {
        // echo "HEHE";
        addItemToCart($userCtrl);
    } elseif (isset($_POST['loadCart'])) {
        loadCartItems($userView);
    } elseif (isset($_POST['removeCartItem'])) {
        removeCartItem($userCtrl);
        loadCartItems($userView);
    } elseif (isset($_POST['checkout'])) {
        checkout($userCtrl);
        sendEmail($userView, $mail);
    } elseif (isset($_POST['keyword'])) {
        searchGames($userView);
    }
}

function addItemToCart($userCtrl)
{

    $user_id = $_SESSION['user_id'] ?? NULL;

    if ($user_id == NULL) {
        echo "ERROR";
        exit();
    }

    $product_id = $_POST['product_id'];
    $quantity = $_POST['quantity'];


    try {
        $action = $userCtrl->addToCart($product_id, $quantity, $user_id);
    } catch (Exception $e) {
        echo "ERROR: $e";
        exit();
    }

    echo $action;
}

function loadCartItems($userView)
{

    $user_id = $_SESSION['user_id'];

    $data = $userView->fetchCartItems($user_id);

    foreach ($data as $cartItem) :
?>
        <div class="card text-white mb-3 w-75 mx-auto" style="background-color: #2C2E34">
            <div class="row g-0">
                <div class="col-md-4" style="height: 203px;">
                    <img src=<?= "{$cartItem['product_thumbnail']}" ?> class="img-fluid object-fit-cover rounded-start w-100 h-100" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body d-flex justify-content-between flex-column h-100">
                        <h5 class="card-title fw-bolder fs-2"><?= $cartItem['product_name'] ?></h5>
                        <div class="card-text">
                            <div class="form-group d-flex gap-2 align-items-center">
                                <label for="" class="form-label">Quantity</label>
                                <input type="number" name="quantity" min=1 id="quantity" value="<?= $cartItem['quantity'] ?>" class="form-control w-25">

                            </div>
                            <p class="card-text">
                            <div class="button-group">
                                <button class="btn btn-warning">Remove Item</button>
                                <button class="btn btn-success">Buy Now</button>
                            </div>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    <?php
    endforeach;
}

function removeCartItem($userCtrl)
{

    $product_id = $_POST['product_id'];
    $user_id = $_SESSION['user_id'];

    $userCtrl->removeFromCart($product_id, $user_id);
}

function checkout($userCtrl)
{

    $user_id = filter_var($_POST['user_id'], FILTER_SANITIZE_NUMBER_INT);
    $recipient_name = htmlspecialchars($_POST['recipient_name'], ENT_QUOTES);
    $product_id = filter_var($_POST['product_id'], FILTER_SANITIZE_NUMBER_INT);
    $quantity = filter_var($_POST['quantity'], FILTER_SANITIZE_NUMBER_INT);
    $order_total = $_POST['order_total'];
    $order_address = htmlspecialchars($_POST['order_address'], ENT_QUOTES);

    $userCtrl->buyItem($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address);
}

function sendEmail($userView, $mail)
{
    $product_id = $_POST['product_id'];

    $product_data = $userView->fetchGameInfo($product_id);
    $product_name = $product_data[0]['product_name'];
    $product_price = $product_data[0]['price'];


    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'lorenz.bocatot@clsu2.edu.ph';
        $mail->Password = 'unncxswdjgskszks ';
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;

        $mail->setFrom('lorenz.bocatot@clsu2.edu.ph');
        $mail->addAddress($_POST['recipient_email']);

        $mail->isHTML(true);

        $mail->Subject = 'GameSpace Order Confirmation';
        $mail->Body = "
        <p>Hello {$_SESSION['username']}, your order has been made!</p>
        <p>Product Name: <b>{$product_name}</b></p>
        <p>Quantity: <b>{$_POST['quantity']}</b></p>
        <p>Price: $<b>{$product_price}</b></p>
        <hr>
        <p>Total Payment: $<b>{$_POST['order_total']}</b></p>
        <hr>
        <p>Recipient Name: <b>{$_POST['recipient_name']}</b></p>
        <p>Address: <b>{$_POST['order_address']}</b></p>
    ";

        $mail->send();
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}

function searchGames($userView)
{

    $keyword = $_POST['keyword'];

    $data = $userView->getProducts("product_name LIKE '%$keyword%'");

    foreach ($data as $game) : ?>
        <div class="card rounded-5 card1" style="width: 18rem;">
            <a href="view_game.php?product_id=<?= $game['id'] ?>">
                <div class="poster">
                    <img src=<?= "{$game['product_thumbnail']}" ?> alt="Yes Poster Image">
                    <div class="title-overlay w-100">
                        <h3><?= $game['product_name'] ?></h3>
                        <div class="product__preview"><?= $game['product_description'] ?></div>
                    </div>

                </div>
                <div class="details">
                    <h5><?= $game['product_name'] ?></h5>
                    <div class="tags d-flex flex-wrap g-4 gap-1">
                        <?php foreach (unserialize($game['game_category']) as $game_tag) : ?>
                            <span class="bg-danger"><?= $game_tag ?></span>
                        <?php endforeach; ?>
                    </div>
                </div>
            </a>
        </div>
<?php endforeach;
}
