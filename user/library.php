<?php
include 'partials/sidebar.php';
include '../classes/dbh.php';
include '../classes/model/userModel.php';
include '../classes/view/userView.php';

$user_id = $_SESSION['user_id'] ?? NULL;
if ($user_id == NULL) {
    header("location: ../login.php");
    exit();
}

$userView = new UserView();
$order_data = $userView->fetchCompletedOrders($user_id);
?>

<div class="container mt-5">
    <h1 class="text-uppercase text-white my-5">Completed Orders</h1>
    <div class="row row-cols-1 row-cols-md-1 g-4">
        <?php foreach ($order_data as $order) : ?>
            <div class="col-lg-3 col-md-6 col-sm-10 mx-auto">
                <div class="card">
                    <?php
                    $src = (str_contains($order['product_thumbnail'], 'https')) ? $order['product_thumbnail'] : "../assets/thumbnails/{$order['product_thumbnail']}";
                    ?>
                    <img src="<?= $src ?>" class="card-img-top object-fit-cover" alt="<?= $order['product_name'] ?> Thumbnail" style="max-height: 170px;">
                    <div class="card-body">
                        <h5 class="card-title text-truncate"><b><?= $order['receipient_name'] ?></b></h5>
                        <p class="card-text text-truncate">Order: <b><?= $order['product_name'] ?></b></p>
                        <p class="card-text text-truncate">Quantity: <b><?= $order['quantity'] ?></b></p>
                        <p class="card-text text-truncate">Order Received: <b><?= $order['order_completed'] ?></b></p>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>