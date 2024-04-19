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
    } elseif (isset($_POST['receive_order'])) {
        setOrderComplete($userCtrl);
        loadOrders($userView);
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

    $username = $_SESSION['username'];
    $receipient_name = $_POST['reciepient_name'];
    $order_address = $_POST['order_address'];
    $order_total = $_POST['order_total'];
    $quantity = $_POST['quantity'];
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
        <p>Hello {$username}, your order has been made!</p>
        <p>Product Name: <b>{$product_name}</b></p>
        <p>Quantity: <b>{$quantity}</b></p>
        <p>Price: $<b>{$product_price}</b></p>
        <hr>
        <p>Total Payment: $<b>{$order_total}</b></p>
        <hr>
        <p>Recipient Name: <b>{$receipient_name}</b></p>
        <p>Address: <b>{$order_address}</b></p>
    ";

        $mail->send();
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
    echo "done";
}

function searchGames($userView)
{

    $keyword = $_POST['keyword'];

    $data = $userView->getProducts("product_name LIKE '%$keyword%'");

    foreach ($data as $game) : ?>
        <?php
        $src = (str_contains($game['product_thumbnail'], 'https') == true) ? $game['product_thumbnail'] : "../assets/thumbnails/" . $game['product_thumbnail'];
        ?>
        <div class="card rounded-5 card1" style="width: 18rem;">
            <a href="view_game.php?product_id=<?= $game['id'] ?>">
                <div class="poster">
                    <img src="<?= $src ?>" alt="Yes Poster Image">
                    <div class="title-overlay w-100">
                        <h3><?= $game['product_name'] ?></h3>
                        <div class="product__preview"><?= $game['product_description'] ?></div>
                    </div>

                </div>
                <div class="details">
                    <h5><?= $game['product_name'] ?></h5>
                    <div class="tags d-flex flex-wrap g-4 gap-1">
                        <?php
                        $cateogry_data = $userView->fetchGameCategories($game['id']);
                        foreach ($cateogry_data as $game_category) :
                        ?>
                            <span class="bg-danger p-1 rounded-1"><?= $game_category['category_name'] ?></span>
                        <?php endforeach; ?>
                    </div>
                </div>
            </a>
        </div>
    <?php endforeach;
}

function setOrderComplete($userCtrl)
{

    $order_id = $_POST['order_id'];

    $userCtrl->setOrderReceived($order_id);
}

function loadOrders($userView)
{

    $user_id = $_SESSION['user_id'];

    $order_data = $userView->fetchOrders($user_id);

    foreach ($order_data as $order) : ?>
        <div class="col">
            <div class="card">
                <img src=<?= "{$order['product_thumbnail']}" ?> class="card-img-top object-fit-cover" alt="<?= $order['product_name'] ?> Thumbnail" style="max-height: 170px;">
                <div class="card-body">
                    <p class="fs-5 text-truncate">Recipient: <b><?= $order['receipient_name'] ?></b></p>
                    <p class="fs-3 text-truncate"><?= $order['product_name'] ?></p>
                    <p class="fs-5">Total: $<?= $order['order_total'] ?></p>
                </div>
                <div class="card-footer d-flex justify-content-between">
                    <h6><?= $order['order_status'] ?></h6>
                    <button class="btn btn-primary" data-order-id="<?= $order['id'] ?>" <?= ($order['order_status'] != 'Delivered') ? 'disabled' : '' ?> onclick="receiveOrder(this)">Order Received</button>
                </div>
            </div>
        </div>
<?php endforeach;
}