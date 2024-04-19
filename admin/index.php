<?php
include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/controller/adminCtrl.php";
require "../classes/view/adminView.php";

$adminCtrl = new AdminCtrl();
$adminView = new AdminView();

$adminCtrl->clear_unused_resources();

$user_count = $adminView->fetchUserCount();
$product_count = $adminView->fetchProductCount();
$pending_count = $adminView->fetchPendingOrders();
$completed_count = $adminView->fetchCompletedOrders();
?>

<!-- <div class="container-fluid text-white"> -->
<div class="row g-1 mt-5 text-white container-fluid px-5">
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md mx-auto" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../assets/svg/person-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3 ">
            <div class="row fw-bolder text-white user-count">User Count</div>
            <div class="row text-white user-count text-center"><?= $user_count[0]['count'] ?? 0 ?></div>
        </div>
    </div>
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md mx-auto" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../assets/svg/box-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3">
            <div class="row fw-bolder text-white user-count">Product Count</div>
            <div class="row text-white user-count text-center"><?= $product_count[0]['count'] ?? 0 ?></div>
        </div>
    </div>
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md mx-auto" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../assets/svg/reciept-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3">
            <div class="row fw-bolder text-white user-count">Total Orders</div>
            <div class="row text-white user-count text-center"><?= $completed_count[0]['count'] ?? 0 ?></div>
        </div>
    </div>
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md mx-auto" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../assets/svg/hourglass-end-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3">
            <div class="row fw-bolder text-white user-count">Pending Orders</div>
            <div class="row text-white user-count"><?= $pending_count[0]['count'] ?? 0 ?></div>
        </div>
    </div>

</div>

<div class="container-fluid mt-5">
    <div class="row d-flex justify-content-evenly gap-1">
        <div class="col-lg-7 col-md-10 border p-2 rounded-4">
            <canvas id="myChart" class="h-100 w-100"></canvas>
        </div>
        <div class="col-lg-4 col-md-10 border p-2 rounded-4">
            <canvas id="categories" height="120"></canvas>
        </div>
    </div>
</div>

<div class="table-responsive mt-5">
    <table class="table table-dark table-hover text-center table-bordered">
        <thead>
            <tr class="table-light">
                <td class="text-uppercase fw-bolder">Id</td>
                <td class="text-uppercase fw-bolder">Customer</td>
                <td class="text-uppercase fw-bolder">Game</td>
                <td class="text-uppercase fw-bolder">Price</td>
                <td class="text-uppercase fw-bolder">Status</td>
            </tr>
        </thead>
        <?php $latest_orders = $adminView->fetchOrders(5); ?>
        <tbody>

            <?php
            $id = 1;
            foreach ($latest_orders as $order) :
            ?>
                <tr>
                    <td><?= $id++ ?></td>
                    <td class="text-truncate"><?= $order['receipient_name'] ?></td>
                    <td class="text-truncate"><?= $order['product_name'] ?></td>
                    <td>$<?= $order['order_total'] ?></td>
                    <td class="text-truncate"><?= $order['order_status'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<!-- </div> -->

<?php

$monthly_data = $adminView->fetchMonthlyRegistrations();
foreach ($monthly_data as $data) {
    $month[] = $data['monthname'];
    $monthly_user_count[] = $data['users'];
}

$popular_categories = $adminView->fetchPopularCategories();
foreach ($popular_categories as $data) {
    $categories[] = $data['category_name'];
    $sold_count[] = $data['products_sold'];
}
?>
<script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: <?= json_encode($month) ?>,
            datasets: [{
                label: '# of User Registrations',
                data: <?= json_encode($monthly_user_count) ?>,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    })

    const ctx1 = document.getElementById('categories');

    new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: <?= json_encode($categories) ?>,
            datasets: [{
                label: '# of Products Sold',
                data: <?= json_encode($sold_count) ?>,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>