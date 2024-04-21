<?php
include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/view/adminView.php";
require "../classes/controller/adminCtrl.php";

$adminView = new AdminView();
?>

<div class="container mt-5">
    <nav class="navbar bg-dark-subtle rounded-3 mb-5">
        <div class="container-fluid">
            <a class="navbar-brand text-uppercase fw-bolder fs-4">Manage Platforms</a>
            <div class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" onkeyup="searchCategory(this.value)">
                <button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#add_modal">Add</button>
            </div>
        </div>
    </nav>
    <div class="table-responsive">
        <table class="table table-dark text-white table-hover table-bordered text-center w-100">
            <thead class="table-light">
                <tr>
                    <th class="col-1 fw-bolder">#</th>
                    <th class="col">Platform Name</th>
                    <th class="col-4">Actions</th>
                </tr>
            </thead>
            <tbody id="table_content_wrapper">
                <?php
                $category_data = $adminView->fetchPlatforms(0, 10);
                $counter = 1;
                foreach ($category_data as $data) :
                ?>
                    <tr>
                        <td class="fw-bolder"><?= $counter++ ?></td>
                        <td><?= $data['platform_name'] ?></td>
                        <td>
                            <button class="btn btn-warning" onclick="loadPlatformInfo(this.value)" value="<?= $data['id'] ?>" data-bs-toggle="modal" data-bs-target="#add_modal">Edit</button>
                            <button class="btn btn-danger" onclick="confirmRemoveContent(this.value)" value="<?= $data['id'] ?>" data-bs-toggle="modal" data-bs-target="#verify_modal">Delete</button>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
            <tfoot class="table-light">
                <tr>
                    <th class="col">#</th>
                    <th class="col">Category Name</th>
                    <th class="col-3">Actions</th>
                </tr>
            </tfoot>
        </table>
    </div>
    <div class="table_pagination">
        <?= include "partials/pagination.php"; ?>
    </div>
</div>

<?= include('partials/add_modal.php'); ?>