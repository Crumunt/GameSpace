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
            <div class="col-lg-3 col-md-6 col-sm-10">
                <div class="card text-white border w-100 h-100" style="background-color: #2C2E34;">
                    <?php
                    $src = (str_contains($game['product_thumbnail'], 'https') == true) ? $game['product_thumbnail'] : "../assets/thumbnails/" . $game['product_thumbnail'];
                    ?>
                    <img src="<?= $src ?>" class="card-img-top w-100 h-100 d-block object-fit-cover" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-truncate"><?= $game['product_name'] ?></h5>
                        <p class="card-text">$<?= $game['price'] ?></p>
                        <button data-product-id="<?= $game['id'] ?>" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editor_modal" onclick="loadGameInfo(this)">Edit</button>
                        <button data-id="products_<?= $game['id'] ?>" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#archive_modal" onclick="confirmDelete(this)">Delete</button>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
<div class="pagination py-5 d-flex justify-content-center gap-3 flex-wrap" id="page_control"></div>

<!-- Modal -->
<div class="modal fade " id="editor_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modal_status" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content bg-secondary-subtle">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="modal_status">Add Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="resetForm()"></button>
            </div>
            <div class="modal-body">
                <form class="form">
                    <div class="form-group mb-3">
                        <label for="" class="form-label">Product Name <span class="text-muted">(Required*)</span></label>
                        <input type="text" class="form-control" id="product_name" onkeyup="checkProductDuplication(this), validateProductInfo(this.value)">
                        <div class="invalid-feedback">
                            Product has already been added
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label for="" class="form-label">Product Description</label>
                        <textarea onkeyup="validateProductInfo(this.value)" name="" id="product_description" cols="30" rows="10" class="form-control" style="max-height: 255px;"></textarea>
                    </div>
                    <div class="form-group mb-3">
                        <label for="product_price" class="form-label">Product Price $ <span class="text-muted">(Required*)</span></label>
                        <input onkeyup="validateProductInfo(this.value)" type="number" value="1" name="product_price" min="1" max="99999" id="product_price" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <div class="accordion accordion-flush" id="accordionFlushExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        Category <span class="text-muted">(Required*)</span>
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body d-flex flex-wrap gap-2">
                                        <?php
                                        $categories = $adminView->fetchCategories();
                                        foreach ($categories as $category) :
                                        ?>
                                            <label for="<?= $category['id'] ?>" class="category-label p-2 rounded-1 border">
                                                <input onchange="validateProductInfo(this.value)" type="checkbox" name="category[]" value="<?= $category['id'] ?>" id="<?= $category['id'] ?>" class="category d-none">
                                                <?= $category['category_name'] ?>
                                            </label>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                        Platforms <span class="text-muted">(Required*)</span>
                                    </button>
                                </h2>
                                <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body d-flex flex-wrap gap-2">
                                        <?php
                                        $platforms = $adminView->fetchPlatforms();
                                        foreach ($platforms as $platform) :
                                        ?>
                                            <label for="platform_<?= $platform['id'] ?>" class="platform-label p-2 rounded-1 border">
                                                <input onchange="validateProductInfo(this.value)" type="checkbox" name="platform[]" value="<?= $platform['id'] ?>" id="platform_<?= $platform['id'] ?>" class="platform d-none">
                                                <?= $platform['platform_name'] ?>
                                            </label>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="resetForm()">Close</button>
                <button type="button" class="btn btn-primary" id="next_button" disabled data-bs-toggle="modal" data-bs-target="#editor_images_modal">Next</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade " id="editor_images_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modal_status_extend" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content bg-secondary-subtle">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="modal_status_extend">Add Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="resetForm()"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6 col-md-10 d-grid justify-content-center">
                        <label for="thumbnail_input" id="thumbnail_label" class="mx-auto border text-center mb-3 btn btn-danger">
                            Add Thumbnail
                            <input type="file" class="d-none" name="" id="thumbnail_input" onchange="addThumbnail(this)">
                        </label>
                        <div id="thumbnail_container" class="mx-auto container mb-3">

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-10 d-grid justify-content-center">
                        <label for="snapshot_input" id="snapshot_label" class="mx-auto text-center mb-3 btn btn-danger">
                            Add Snapshots
                            <input type="file" class="d-none" name="snapshots[]" multiple id="snapshot_input" onchange="addSnapshots(this)">
                        </label>
                        <div id="snapshot_container" class="d-flex gap-2 justify-content-center flex-wrap w-100">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#editor_modal">Back</button>
                <button type="button" id="save_button" class="btn btn-primary" onclick="addProduct()" data-bs-dismiss="modal">Save</button>
            </div>
        </div>
    </div>
</div>

<?php include "partials/archive_modal.php"; ?>