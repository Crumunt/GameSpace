<?php
include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new UserView();

$category_data = $userView->fetchCategories();
?>
<section class="home-section">
    <nav class="navbar bg-dark-subtle rounded-3 m-5 p-3">
        <div class="container-fluid">
            <h1 class="text-start text-uppercase col-lg-8 col-sm-10" id="header_title">Browse Categories</h1>
            <div class="search_form col-lg-3 col-sm-10">
                <!-- <input type="search" name="" id="" class="form-control w-100" placeholder="Search for Games" onkeyup="searchGames(this.value)"> -->
            </div>
        </div>
    </nav>

    <div class="category__wrapper">
        <?php foreach ($category_data as $category) : ?>
            <div class="card card<?= rand(1, 8) ?>">
                <div class="poster">
                    <img src=<?= "{$category['background_image']}" ?> alt="Yes Poster Image">
                    <div class="title-overlay">
                        <h2><?= $category['category_name'] ?></h2>
                    </div>
                </div>
                <a href="games.php?category=<?= "{$category['category_name']}" ?>">
                    <div class="details">
                        <!-- <h1><?= $category['category_name'] ?></h1> -->
                        <div><?= $category['description'] ?></div>
                    </div>
                </a>
            </div>
        <?php endforeach ?>
    </div>
    <div class="pagination pb-5 d-flex justify-content-center gap-3 flex-wrap" id="page_control"></div>
</section>

<?php include "partials/footer.php"; ?>