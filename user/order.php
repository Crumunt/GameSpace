<?php

include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/userModel.php";
require "../classes/view/userView.php";

$user_id = $_SESSION['user_id'] ?? NULL;

if ($user_id == NULL) {
    header("location: ../index.php?error=UserNotLoggedIn");
    exit();
}

$userView = new UserView();

$order_data = $userView->fetchOrders($user_id);

?>

<div class="container" style="min-height: 100vh;">
    <?php foreach ($order_data as $order) : ?>
        <div class="card my-5 discount__card shadow overflow-hidden w-100">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src=<?= "{$order['product_thumbnail']}" ?> class="img-fluid d-block rounded-start w-100 h-100" alt="<?= $order['product_name'] ?> Thumbnail">
                </div>
                <div class="col-md-8">
                    <div class="card-body text-white discount__body">
                        <div class="header border-bottom d-flex justify-content-between gap-2 align-items-center">
                            <h1 class="text-truncate"><?= $order['product_name'] ?></h1>
                            <h6><?= $order['order_status'] ?></h6>
                        </div>
                        <div class="order_details mt-1 border-bottom">
                            <p class="fs-5">Recipient: <b><?= $order['receipient_name'] ?></b></p>
                            <p class="fs-5">Address: <b><?= $order['order_address'] ?></b></p>
                            <p class="fs-5">Quantity: <?= $order['quantity'] ?></p>
                        </div>
                        <div class="order_price mt-2">
                            <p class="fs-5">Total: $<?= $order['order_total'] ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <?php endforeach; ?>
</div>


<?php include "partials/footer.php"; ?>