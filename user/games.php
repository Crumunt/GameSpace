<?php

include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new UserView();

$game_data = $userView->getProducts(0, 30);
?>
<section class="home-section">
    <div class="heading-wrapper">
        <h1 class="pt-5 text-uppercase">All Games</h1>
    </div>

    <div id="games-container" class="mt-5">
        <?php foreach ($game_data as $game) : ?>
            <div class="card card1">
                <a href="view_game.php?product_id=<?= $game['id'] ?>">
                    <div class="poster">
                        <img src=<?= "{$game['product_thumbnail']}" ?> alt="Yes Poster Image">
                        <div class="title-overlay">
                            <h2><?= $game['product_name'] ?></h2>
                            <div class="product__preview"><?= $game['product_description'] ?></div>
                        </div>

                    </div>
                    <div class="details">
                        <h1><?= $game['product_name'] ?></h1>
                        <div class="tags">
                            <?php foreach (unserialize($game['game_category']) as $game_tag) : ?>
                                <span class="bg-danger"><?= $game_tag ?></span>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="pagination" id="pagination">
</section>



<?php include "user/partials/footer.php"; ?>
<script>
    const gamesContainer = document.getElementById('games-container');
    const pagination = document.getElementById('pagination');
    const cards = document.querySelectorAll('.card');
    const cardsPerPage = 12;
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
            const button = document.createElement('button');
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




    window.onload = function() {
        const sidebar = document.querySelector(".sidebar");
        const closeBtn = document.querySelector("#btn");
        const searchBtn = document.querySelector(".bx-search")

        closeBtn.addEventListener("click", function() {
            sidebar.classList.toggle("open")
            menuBtnChange()
        })

        searchBtn.addEventListener("click", function() {
            sidebar.classList.toggle("open")
            menuBtnChange()
        })

        function menuBtnChange() {
            if (sidebar.classList.contains("open")) {
                closeBtn.classList.replace("bx-menu", "bx-menu-alt-right")
            } else {
                closeBtn.classList.replace("bx-menu-alt-right", "bx-menu")
            }
        }
    }
</script>