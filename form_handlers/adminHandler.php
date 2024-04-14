<?php

require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/view/adminView.php";
require "../classes/controller/adminCtrl.php";

$adminView = new AdminView();
$adminCtrl = new AdminCtrl();

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    if (isset($_POST['product_keyword'])) {
        searchProduct($adminView);
    }
}

function searchProduct($adminView)
{

    $keyword = htmlspecialchars($_POST['product_keyword'], ENT_QUOTES);

    $data = $adminView->searchProduct($keyword);

    foreach ($data as $game) : ?>
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
<?php endforeach;
}
