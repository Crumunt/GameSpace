<?php

include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new UserView();

$filter = $_GET['category'] ?? NULL;

if ($filter != NULL) {
    $game_data = $userView->getProducts("game_category LIKE '%$filter%'");
} else {
    $game_data = $userView->getRandomProducts(NULL);
}

?>
<section class="home-section container-fluid">
    <div class="heading-wrapper p-5 pb-0 d-lg-flex align-items-center">
        <h1 class="text-start text-uppercase col-lg-8 col-sm-10">All Games</h1>
        <div class="search_form col-lg-3 col-sm-10">
            <input type="search" name="" id="" class="form-control w-100" placeholder="Search for Games" onkeyup="searchGames(this.value)">
        </div>
    </div>

    <div id="games-container" class="d-flex flex-wrap gap-4 justify-content-center mt-5" onload="seachForm('')">
    </div>
    <div class="pagination pb-5 d-flex justify-content-center gap-3 flex-wrap" id="page_control"></div>
</section>


<?php include "partials/footer.php"; ?>