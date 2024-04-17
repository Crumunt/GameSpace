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
    } elseif (isset($_POST['add_game'])) {
        addGame($adminCtrl);
    }
}

function searchProduct($adminView)
{

    $keyword = htmlspecialchars($_POST['product_keyword'], ENT_QUOTES);

    $data = $adminView->searchProduct($keyword);

    foreach ($data as $game) : ?>
        <?php
        $src = (str_contains($game['product_thumbnail'], 'https') == true) ? $game['product_thumbnail'] : "../assets/thumbnails/" . $game['product_thumbnail'];
        ?>
        <div class="col-lg-3 col-md-6 col-sm-10">
            <div class="card text-white border w-100 h-100" style="background-color: #2C2E34;">
                <img src="<?= $src ?>" class="card-img-top w-100 h-100 d-block object-fit-cover" alt="...">
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

function addGame($adminCtrl)
{
    $data = [];
    foreach ($_POST as $name => $value) {
        if ($name == 'add_game') continue;
        $data[$name] = $value;
    }
    $some_data = [];
    if (!empty($_FILES['game_images'] ?? NULL)) {
        foreach ($_FILES['game_images'] as $name => $value) {
            $data["image"][$name] = $value;
            $some_data[$name] = $value;
        }
    }

    try {
        $action = $adminCtrl->addProduct($data);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}
