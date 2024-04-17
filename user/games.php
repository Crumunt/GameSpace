<?php

include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new UserView();

$filter = $_GET['category'] ?? NULL;

if ($filter != NULL) {
    $data = $userView->getProducts("category_name LIKE '%$filter%'");
} else {
    $data = $userView->getProducts(NULL);
}

?>
<section class="home-section container-fluid">
    <div class="heading-wrapper p-5 pb-0 d-lg-flex align-items-center">
        <h1 class="text-start text-uppercase col-lg-8 col-sm-10">All Games</h1>
        <div class="search_form col-lg-3 col-sm-10">
            <input type="search" name="" id="" class="form-control w-100" placeholder="Search for Games" onkeyup="searchGames(this.value)">
        </div>
    </div>

    <div id="games-container" class="d-flex flex-wrap gap-4 justify-content-evenly mt-5">
        <?php foreach ($data as $game) : ?>
            <div class="card rounded-5 card1" style="width: 18rem; display: block;">
                <a href="view_game.php?product_id=<?= $game['id'] ?>">
                    <div class="poster">
                        <img src=<?= "{$game['product_thumbnail']}" ?> alt="Yes Poster Image">
                        <div class="title-overlay w-100">
                            <h3><?= $game['product_name'] ?></h3>
                            <div class="product__preview"><?= $game['product_description'] ?></div>
                        </div>

                    </div>
                    <div class="details">
                        <h5><?= $game['product_name'] ?></h5>
                        <div class="tags d-flex flex-wrap g-4 gap-1">
                            <?php
                            $cateogry_data = $userView->fetchGameCategories($game['id']);
                            foreach ($cateogry_data as $game_category) :
                            ?>
                                <span class="bg-danger p-1 rounded-1"><?= $game_category['category_name'] ?></span>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="pagination pb-5 d-flex justify-content-center gap-3 flex-wrap" id="page_control"></div>
</section>


<?php include "partials/footer.php"; ?>