<?php
if($page == 'manage-categories') {
    $data = $adminView->fetchCategories(0, NULL);
}elseif($page == 'manage-platforms') {
    $data = $adminView->fetchPlatforms();
}

$number_of_items = 10;
$pages = ceil(count($data) / $number_of_items);
?>
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-lg justify-content-center" aria-label="<?= $page ?>" data-pages="<?= $pages ?>" id="table_pagination">
        <!-- <li class="page-item">
            <button class="page-link disabled" id="previous" onclick="changePage(this)">Previous</button>
        </li> -->
        <?php for ($i = 1; $i <= $pages; $i++) {
        ?>
            <li class="page-item">
                <button class="number_page page-link <?= ($i == 1) ? 'active' : '' ?>" data-page-number="<?= ($i - 1) ?>" onclick="changePage(this)"><?= $i ?></button>
            </li>
        <?php
        }
        ?>
        <!-- <li class="page-item">
            <button class="page-link" data-page-number="1" id="next" onclick="changePage(this)">Next</button>
        </li> -->
    </ul>
</nav>