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
    <div class="row row-cols-lg-4 row-cols-md-2 row-cols-sm-1 g-4">
        <?php foreach ($order_data as $order) : ?>
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
                        <button class="btn btn-primary" <?= ($order['order_completed'] == NULL) ? 'disabled': '' ?> >Order Received</button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>


<?php include "partials/footer.php"; ?>