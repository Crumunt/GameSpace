<?php

include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/view/adminView.php";

$adminView = new AdminView();
$order_data = $adminView->fetchOrders();
?>

<div class="container mt-5">
    <nav class="navbar bg-dark-subtle rounded-3 mb-5">
        <div class="container-fluid">
            <a class="navbar-brand text-uppercase fw-bolder fs-4">Manage Orders</a>
        </div>
    </nav>
    <div class="row row-cols-1 row-cols-md-1 g-4" id="content_wrapper">
        <?php foreach ($order_data as $order) : ?>
            <div class="col-lg-3 col-md-6 col-sm-10 mx-auto">
                <div class="card">
                    <!-- <img class="card-img-top" src="..." alt="Card image cap"> -->
                    <div class="card-body">
                        <h5 class="card-title text-truncate"><b><?= $order['receipient_name'] ?></b></h5>
                        <p class="card-text text-truncate">Order: <b><?= $order['product_name'] ?></b></p>
                        <p class="card-text text-truncate">Quantity: <b><?= $order['quantity'] ?></b></p>
                        <p class="card-text"><small class="text-muted">Total Price to pay: $<b><?= $order['order_total'] ?></b></small></p>
                        <button data-order-id="<?= $order['id'] ?>" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#order_modal" onclick="getOrderInfo(this)">View Order</button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>


<!-- MODAL -->
<div class="modal fade" id="order_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Update Order Status</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Ordered Product: <b id="order_product"></b></p>
                <p>Platform: <b id="order_platform"></b></p>
                <p>Recepient Name: <b id="receipient_holder"></b></p>
                <p>Address: <b id="order_address"></b></p>
                <p>Quantity: <b id="order_quantity"></b></p>
                <p>Total($): <b id="order_total"></b></p>
                <form action="">
                    <label for="" class="form-label w-100">
                        Order Status:
                        <select name="" id="order_status" class="form-select">
                            <option value="Preparing to ship">Preparing to ship</option>
                            <option value="Shipped">Shipped</option>
                            <option value="On transit">On transit</option>
                            <option value="Delivered">Delivered</option>
                        </select>
                    </label>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="updateOrderButton" class="btn btn-primary" onclick="updateOrderInfo()">Update Order Status</button>
            </div>
        </div>
    </div>
</div>