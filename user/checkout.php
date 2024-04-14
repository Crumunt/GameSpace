<?php

include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/userModel.php";
require "../classes/view/userView.php";

$user_id = $_SESSION['user_id'] ?? NULL;
$product_id = $_GET['product_id'] ?? NULL;
$quantity = $_GET['quantity'] ?? NULL;

if($product_id == NULL || $quantity == NULL || $user_id == NULL) {
    header("location: ../login.php");
    exit();
}

$userView = new UserView();

$data = $userView->fetchGameInfo($product_id);

?>

<div class="container my-5">
    <div class="row g-3 bg-secondary-subtle rounded-3">
        <div class="col-lg-4 col-md-10 order-md-last">
            <h4 class="d-flex justify-content-between align-item-center">
                <span class="text-muted mb-4">Your Item</span>
            </h4>
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between">
                    <div>
                        <h6 class="text-truncate fs-5 fw-bolder"><?= $data[0]['product_name'] ?></h6>
                        <span class="text-muted">Quantity: <span id="order_quantity"><?= $quantity ?></span></span>
                    </div>
                    <span class="text-muted">$ <?= $data[0]['price'] ?></span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <div>
                        <h6>Total ($)</h6>
                    </div>
                    <span class="text-muted">$ <span id="order_total"><?= ($data[0]['price'] * $quantity) ?></span></span>
                </li>
            </ul>
        </div>
        <div class="col-lg-8 col-md-10">
            <h4>Billing Address</h4>
            <div class="form">
                <div class="row">
                    <div class="col-12">
                        <label class="form-label" for="firstname">Full Name</label>
                        <input type="text" id="fullname" class="form-control checkout_data" onkeyup="checkInput()" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label" for="email">Email
                            <span class="text-muted"> (Required)</span>
                        </label>
                        <input type="text" id="email" class="form-control checkout_data" onkeyup="checkInput()" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label" for="address">Address </label>
                        <input type="text" id="address" class="form-control checkout_data" onkeyup="checkInput()" required>
                    </div>
                </div>
                <hr>
                <button type="submit" id="checkout_button" disabled class="btn btn-primary btn-block mb-4" onclick="checkout(<?= $user_id . ',' .$product_id?>) " data-bs-toggle="modal" data-bs-target="#confirmModal">Proceed To Checkout</button>
            </div>
        </div>
    </div>
</div>

<?php
include "partials/modal.php";
include "partials/footer.php";

?>