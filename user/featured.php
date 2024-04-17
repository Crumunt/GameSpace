<?php
include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new Userview();

$banner__product = $userView->getRandomProducts(1);
?>
<div class="container">
    <h1 class="text-white mt-3 fw-bold">Featured & Recommended</h1>
    <div class="card mt-2 discount__card shadow" style="">
        <div class="row g-0">
            <div class="col-md-4">
                <img src=<?= "{$banner__product[0]['product_thumbnail']}" ?> class="img-fluid rounded-start w-100 h-100" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body text-white discount__body">
                    <h5 class="card-title fw-bolder fs-2"><?= $banner__product[0]['product_name'] ?></h5>
                    <div class="d-flex flex-wrap gap-2 mb-2">
                        <?php foreach (unserialize($banner__product[0]['game_category']) as $banner__category) : ?>
                            <span class="bg-danger rounded-1 p-1"><?= $banner__category ?></span>
                        <?php endforeach; ?>
                    </div>
                    <div class="card-text discount__preview"><?= $banner__product[0]['product_description'] ?></div>
                    <a href="view_game.php?product_id=<?= $banner__product[0]['id'] ?>" class="btn btn-outline-info mt-2">Get Here</a>
                </div>
            </div>
        </div>
    </div>
    <!-- POPULAR TITLES START -->
    <div class="row mt-5">
        <h1 class="text-white">Popular Titles</h1>
        <!-- FIRST ROW -->
        <div class="row d-flex g-3">
            <?php
            $popular__products_data = $userView->getRandomProducts(2);
            foreach ($popular__products_data as $popular__items) :
            ?>
                <div class="col-lg-6 col-md-10 mx-auto">
                    <div class="card text-bg-dark overflow-hidden" style="max-height: 350px;">
                        <img src=<?= "{$popular__items['product_thumbnail']}" ?> class="card-img" alt="..." style="filter: brightness(.5);">
                        <a href="view_game.php?product_id=<?= $popular__items['id'] ?>" class="text-decoration-none text-white">
                            <div class="card-img-overlay">
                                <h3><?= $popular__items['product_name'] ?></h3>
                                <div class="d-flex gap-2 flex-wrap">
                                    <?php
                                    $cateogry_data = $userView->fetchGameCategories($popular__items['id']);
                                    foreach ($cateogry_data as $game_category) :
                                    ?>
                                        <span class="bg-danger p-1 rounded-1"><?= $game_category['category_name'] ?></span>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            <?php endforeach ?>
        </div>
        <!-- SECOND ROW -->
        <div class="row d-flex my-5 mx-auto g-1">
            <?php
            $popular__products_data = $userView->getRandomProducts(3);
            foreach ($popular__products_data as $popular__items) :
            ?>
                <div class="col-lg-4 col-md-5 mx-auto">
                    <div class="card text-bg-dark overflow-hidden" style="max-height: 230px;">
                        <img src=<?= "{$popular__items['product_thumbnail']}" ?> class="card-img" alt="..." style="filter: brightness(.5);">
                        <a href="view_game.php?product_id=<?= $popular__items['id'] ?>" class="text-decoration-none text-white">
                            <div class="card-img-overlay">
                                <h3><?= $popular__items['product_name'] ?></h3>
                                <div class="d-flex gap-2 flex-wrap">
                                    <?php
                                    $cateogry_data = $userView->fetchGameCategories($popular__items['id']);
                                    foreach ($cateogry_data as $game_category) :
                                    ?>
                                        <span class="bg-danger p-1 rounded-1"><?= $game_category['category_name'] ?></span>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            <?php endforeach ?>
        </div>
        <!-- LAST ROW -->
        <div class="row d-flex mb-5 mx-auto g-3">
            <?php
            $popular__products_data = $userView->getRandomProducts(4);
            foreach ($popular__products_data as $popular__items) :
            ?>
                <div class="col-lg-3 col-md-4 col-sm-10">
                    <div class="card text-bg-dark overflow-hidden" style="max-height: 187px;">
                        <img src=<?= "{$popular__items['product_thumbnail']}" ?> class="card-img" alt="..." style="filter: brightness(.5);">
                        <a href="view_game.php?product_id=<?= $popular__items['id'] ?>" class="text-decoration-none text-white">
                            <div class="card-img-overlay">
                                <h3><?= $popular__items['product_name'] ?></h3>
                                <div class="d-flex gap-2 flex-wrap">
                                    <?php
                                    $cateogry_data = $userView->fetchGameCategories($popular__items['id']);
                                    foreach ($cateogry_data as $game_category) :
                                    ?>
                                        <span class="bg-danger p-1 rounded-1"><?= $game_category['category_name'] ?></span>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            <?php endforeach ?>
        </div>
    </div>
    <!-- POPULAR TITLES END -->
</div>
<?php include "partials/footer.php"; ?>