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
    } elseif (isset($_POST['update_game'])) {
        updateGame($adminCtrl);
    }elseif(isset($_POST['archive_data'])) {
        archiveData($adminCtrl);
    }
}

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    if (isset($_GET['product_id'])) {
        fetchGameInfo($adminView);
    }
    if (isset($_GET['archive_content'])) {
        fetchToDeleteInfo($adminView);
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
                    <button data-product-id="<?= $game['id'] ?>" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editor_modal" onclick="loadGameInfo(this)">Edit</button>
                    <button data-id="products_<?= $game['id'] ?>" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#archive_modal" onclick="confirmDelete(this)">Delete</button>
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

    if (!empty($_FILES['game_images'] ?? NULL)) {
        foreach ($_FILES['game_images'] as $name => $value) {
            $data["image"][$name] = $value;
        }
    }

    try {
        $action = $adminCtrl->addProduct($data);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}

function fetchGameInfo($adminView)
{

    $product_id = $_GET['product_id'];

    $game_data = $adminView->fetchProductInfo($product_id);

    $data = [];

    foreach ($game_data as $name => $value) {
        $data[$name] = $value;
    }
    echo json_encode($data);
}

function updateGame($adminCtrl)
{

    $data = [];
    foreach ($_POST as $name => $value) {
        if ($name == 'update_game') continue;
        $data[$name] = $value;
    }

    if (!empty($_FILES['game_images'] ?? NULL)) {
        foreach ($_FILES['game_images'] as $name => $value) {
            $data["image"][$name] = $value;
        }
    }

    try {
        $adminCtrl->updateGame($data);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}

function fetchToDeleteInfo($adminView)
{

    $id = $_GET['archive_content'];
    $tbl = $_GET['tbl'];

    if ($tbl == 'products') {
        $data = $adminView->fetchProductInfo($id);
    }

    echo json_encode($data);
}

function archiveData($adminCtrl) {

    $id = $_POST['archive_data'];
    $tbl = $_POST['tbl'];

    if($tbl == 'products') {
        $adminCtrl->archiveGame($id);
        echo "Product has been arhived successfully";
    }

}