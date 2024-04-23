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

<div class="container py-3" style="min-height: 100vh;">
    <h1 class="text-white text-uppercase mb-5">Orders</h1>
    <div class="row row-cols-lg-4 row-cols-md-2 row-cols-sm-1 g-4" id="content_wrapper">
        <?php foreach ($order_data as $order) : ?>
            <div class="col">
                <div class="card">
                    <?php
                    $src = (str_contains($order['product_thumbnail'], 'https')) ? $order['product_thumbnail'] : "../assets/thumbnails/{$order['product_thumbnail']}";
                    ?>
                    <img src="<?= $src ?>" class="card-img-top object-fit-cover" alt="<?= $order['product_name'] ?> Thumbnail" style="max-height: 170px;">
                    <div class="card-body">
                        <p class="fs-5 text-truncate">Recipient: <b><?= $order['receipient_name'] ?></b></p>
                        <p class="fs-3 text-truncate"><?= $order['product_name'] ?></p>
                        <p class="fs-5">Total: $<?= $order['order_total'] ?></p>
                    </div>
                    <div class="card-footer d-flex justify-content-center flex-column">
                        <h6><?= $order['order_status'] ?></h6>
                        <button value="<?= $order['id'] ?>" onclick="setOrderId(this.value)" class="btn btn-primary" <?= ($order['order_status'] != 'Delivered') ? 'disabled' : '' ?> data-bs-toggle="modal" data-bs-target="#order_confirmation">Order Received</button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<div class="modal" id="order_confirmation" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm Order</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="text-center fw-bolder fs-4">Have you received your order?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">No</button>
                <button type="button" id="confirm_receive_order" onclick="receiveOrder(this)" class="btn btn-outline-success" data-bs-dismiss="modal">Yes</button>
            </div>
        </div>
    </div>
</div>


<?php include "partials/footer.php"; ?>