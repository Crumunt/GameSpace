<?php
include "partials/sidebar.php";
require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/view/adminView.php";

$adminView = new AdminView();
$tbl = 'tbl_products';

$data = $adminView->showProducts();

?>


<div class="container mt-5">
    <nav class="navbar bg-dark-subtle rounded-3">
        <div class="container-fluid">
            <a class="navbar-brand text-uppercase fw-bolder fs-4">Manage Products</a>
            <div class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" onkeyup="searchProduct(this.value)">
                <button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#editor_modal">Add</button>
            </div>
        </div>
    </nav>


    <div id="content_wrapper" class="row row-cols-lg-4 row-cols-md-2 row-cols-sm-1 g-4 mt-5">
        <?php foreach ($data as $game) : ?>
            <div class="col">
                <div class="card text-white border w-100 h-100" style="background-color: #2C2E34;">
                    <img src="<?= $game['product_thumbnail'] ?>" class="card-img-top w-100 h-100 d-block object-fit-cover" alt="..." style="max-height: 171px;">
                    <div class="card-body">
                        <h5 class="card-title text-truncate"><?= $game['product_name'] ?></h5>
                        <p class="card-text">$<?= $game['price'] ?></p>
                        <button class="btn btn-warning">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
<div class="pagination py-5 d-flex justify-content-center gap-3 flex-wrap" id="page_control"></div>

<!-- Modal -->
<div class="modal fade " id="editor_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content bg-secondary-subtle">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form">
                    <div class="form-group mb-3">
                        <label for="" class="form-label">Product Name</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="" class="form-label">Product Description</label>
                        <textarea name="" id="" cols="30" rows="10" class="form-control" style="max-height: 255px;"></textarea>
                    </div>
                    <div class="form-group mb-3">
                        <div class="accordion accordion-flush" id="accordionFlushExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        Category
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body d-flex flex-wrap gap-2">
                                        <?php
                                        $categories = $adminView->fetchCategories();
                                        foreach ($categories as $category) :
                                        ?>
                                            <label for="<?= $category['id'] ?>" class="category-label p-2 rounded-1 border">
                                                <input type="checkbox" name="" id="<?= $category['id'] ?>" class="d-none">
                                                <?= $category['category_name'] ?>
                                            </label>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                        Platforms
                                    </button>
                                </h2>
                                <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body d-flex flex-wrap gap-2">
                                        <?php
                                        $platforms = $adminView->fetchPlatforms();
                                        foreach ($platforms as $platform) :
                                        ?>
                                            <label for="<?= $platform['id'] ?>" class="category-label p-2 rounded-1 border">
                                                <input type="checkbox" name="" id="<?= $platform['id'] ?>" class="d-none">
                                                <?= $platform['platform_name'] ?>
                                            </label>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Understood</button>
            </div>
        </div>
    </div>
</div>