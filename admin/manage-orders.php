<?php

include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/view/adminView.php";

$adminView = new AdminView();

?>


<div class="">
    <div class="table-responsive mt-5">
        <table class="table table-dark" style="table-layout: fixed;">
            <thead>
                <tr class="text-center">
                    <th>Name</th>
                    <th>Product Name</th>
                    <th>Address</th>
                    <th>Quanity</th>
                    <th>Total Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $order_data = $adminView->fetchOrders();
                foreach ($order_data as $order) :
                ?>
                    <tr class="text-center">
                        <td class="pt-4">
                            <p class="text-truncate"><?= $order['receipient_name'] ?></p>
                        </td>
                        <td class="pt-4">
                            <p class="text-truncate"><?= $order['product_name'] ?></p>
                        </td>
                        <td class="pt-4">
                            <p class="text-truncate"><?= $order['order_address'] ?></p>
                        </td>
                        <td class="pt-4">
                            <p class="text-truncate">
                                <?= $order['quantity'] ?>
                            </p>
                        </td>
                        <td class="pt-4">
                            <p class="text-truncate">
                                $<?= $order['order_total'] ?>
                            </p>
                        </td>
                        <td class="p-4 row">
                            <select name="" id="" class="form-select col-md-10" onchange="changeOrderStatus(<?= $order['id'] ?>, this.value)">
                                <option value="<?= $order['order_status'] ?>" selected><?= $order['order_status'] ?></option>
                                <option value="On Delivery">On Delivery</option>
                                <option value="Delivered">Delivered</option>
                            </select>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>