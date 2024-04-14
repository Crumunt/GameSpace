<?php

include "partials/sidebar.php";

?>

<!-- <div class="container-fluid text-white"> -->
<div class="row g-1 mt-5 text-white container-fluid px-5">
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../admin side/svg/person-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3 ">
            <div class="row fw-bolder text-white user-count">User Count</div>
            <div class="row text-white user-count text-center">143</div>
        </div>
    </div>
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../admin side/svg/box-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3">
            <div class="row fw-bolder text-white user-count">Product Count</div>
            <div class="row text-white user-count text-center">800</div>
        </div>
    </div>
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../admin side/svg/reciept-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3">
            <div class="row fw-bolder text-white user-count">Total Orders</div>
            <div class="row text-white user-count text-center">2778</div>
        </div>
    </div>
    <div class="col-lg-3 col-md-5 col-sm-10 p-2 d-flex status-boxes shadow-md" style="background-color: #31363F;">
        <div class="col d-flex align-items-center justify-content-center"><img src="../admin side/svg/hourglass-end-svgrepo-com.svg" alt="person" height="50" class="pink"></div>
        <div class="col py-3">
            <div class="row fw-bolder text-white user-count">Pending Orders</div>
            <div class="row text-white user-count">219</div>
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

<div class="container-fluid mt-5">
    <table class="table table-responsive table-dark table-hover">
        <thead>
            <tr>
                <td class="text-uppercase fw-bolder">Id</td>
                <td class="text-uppercase fw-bolder">Customer</td>
                <td class="text-uppercase fw-bolder">Game</td>
                <td class="text-uppercase fw-bolder">Price</td>
                <td class="text-uppercase fw-bolder">Status</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Francis</td>
                <td>elden</td>
                <td>$21.99</td>
                <td>Success</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Francis</td>
                <td>elden</td>
                <td>$21.99</td>
                <td>Success</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Francis</td>
                <td>elden</td>
                <td>$21.99</td>
                <td>Success</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Francis</td>
                <td>elden</td>
                <td>$21.99</td>
                <td>Success</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Francis</td>
                <td>elden</td>
                <td>$21.99</td>
                <td>Success</td>
            </tr>
        </tbody>
    </table>
</div>
<!-- </div> -->

<script>
    const ctx = document.getElementById('myChart');
    const ctx1 = document.getElementById('categories');

    new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
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

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
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
</script>