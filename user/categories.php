<?php
include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new UserView();

$category_data = $userView->fetchCategories();
?>
<section class="home-section">
    <div class="heading-wrapper">
        <h1 class="text-uppercase">Categories</h1>
    </div>

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
</section>

<?php include "partials/footer.php"; ?>