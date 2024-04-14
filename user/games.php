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

    <div id="games-container" class="d-flex flex-wrap gap-4 justify-content-center mt-5">
        <?php foreach ($game_data as $game) : ?>
            <div class="card rounded-5 card1" style="width: 18rem;">
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
                        <div class="tags d-flex flex-wrap g-2 gap-1">
                            <?php foreach (unserialize($game['game_category']) as $game_tag) : ?>
                                <span class="bg-danger"><?= $game_tag ?></span>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="pagination pb-5 d-flex justify-content-center gap-3 flex-wrap" id="page_control"></div>
</section>


<?php include "user/partials/footer.php"; ?>

<script>
    const gamesContainer = document.getElementById('games-container');
    const pagination = document.getElementById('page_control');
    const cards = document.querySelectorAll('.card');
    const cardsPerPage = 20;
    let currentPage = 1;

    function showPage(page) {
        const startIndex = (page - 1) * cardsPerPage;
        const endIndex = startIndex + cardsPerPage;

        cards.forEach((card, index) => {
            if (index >= startIndex && index < endIndex) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    function createPaginationButtons() {
        const totalPages = Math.ceil(cards.length / cardsPerPage);
        pagination.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            let button = document.createElement('button');
            button.classList.add('btn')
            button.classList.add('btn-outline-light')
            button.innerText = i;
            if (i === currentPage) {
                button.classList.add('active');
            }
            button.addEventListener('click', () => {
                currentPage = i;
                showPage(currentPage);
                updatePaginationButtons();
            });
            pagination.appendChild(button);
        }
    }

    function updatePaginationButtons() {
        const buttons = document.querySelectorAll('.pagination button');
        buttons.forEach((button, index) => {
            if (index + 1 === currentPage) {
                button.classList.add('active');
            } else {
                button.classList.remove('active');
            }
        });
    }

    showPage(currentPage);
    createPaginationButtons();

</script>