<?php
require "../classes/dbh.php";
require "../classes/model/adminModel.php";
require "../classes/view/adminView.php";
require "../classes/controller/adminCtrl.php";

$adminView = new AdminView();
$adminCtrl = new AdminCtrl();

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    if (isset($_POST['product_keyword'])) {
        findProduct($adminView);
    } elseif (isset($_POST['add_game'])) {
        addGame($adminCtrl);
    } elseif (isset($_POST['update_game'])) {
        updateGame($adminCtrl);
    } elseif (isset($_POST['archive_data'])) {
        archiveData($adminCtrl);
    } elseif (isset($_POST['update_order'])) {
        updateOrderStatus($adminCtrl);
    } elseif (isset($_POST['load_products'])) {
        loadProducts($adminView);
        echo "THIS IS HAPPENING";
    } elseif (isset($_POST['load_orders'])) {
        loadOrders($adminView);
    } elseif (isset($_POST['addContent'])) {
        addContent($adminCtrl);
    } elseif (isset($_POST['updateContent'])) {
        updateContent($adminCtrl, $adminView);
    } elseif (isset($_POST['content_delete_id'])) {
        removeContent($adminCtrl, $adminView);
    }
}

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    if (isset($_GET['product_id'])) {
        fetchGameInfo($adminView);
    }
    if (isset($_GET['archive_content'])) {
        fetchToDeleteInfo($adminView);
    }
    if (isset($_GET['order_id'])) {
        getOrderInfo($adminView);
    }
    if (isset($_GET['product_name'])) {
        checkDuplicateProducts($adminView);
    }
    if (isset($_GET['category_page'])) {
        loadCategoriesByPage($adminView);
    }
    if (isset($_GET['platform_page'])) {
        loadPlatformsByPage($adminView);
    }
    if (isset($_GET['platform_id'])) {
        getPlatform($adminView);
    }
    if (isset($_GET['category_id'])) {
        getCategory($adminView);
    }
    if (isset($_GET['category_keyword'])) {
        getCategory($adminView);
    }
    if (isset($_GET['content_keyword'])) {
        searchDuplicateContent($adminView);
    }
    if (isset($_GET['confirm_delete'])) {
        getContentInfo($adminView);
    }
    if (isset($_GET['platform_keyword'])) {
        getPlatform($adminView);
    }
    if(isset($_GET['reload_pagination'])) {
        reloadPagination($adminView);
    }
}

function loadProducts($adminView = NULL, $data = NULL)
{
    if ($data == NULL) {
        $data = $adminView->showProducts();
    }

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

function loadOrders($adminView = NULL, $order_data = NULL)
{

    if ($order_data == NULL) {
        $order_data = $adminView->fetchOrders();
    }

    foreach ($order_data as $order) : ?>
        <div class="col-lg-3 col-md-6 col-sm-10 mx-auto">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title text-truncate"><b><?= $order['receipient_name'] ?></b></h5>
                    <p class="card-text text-truncate">Order: <b><?= $order['product_name'] ?></b></p>
                    <p class="card-text text-truncate">Quantity: <b><?= $order['quantity'] ?></b></p>
                    <p class="card-text"><small class="text-muted">Total Price to pay: $<b><?= $order['order_total'] ?></b></small></p>
                    <button data-order-id="<?= $order['id'] ?>" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#order_modal" onclick="getOrderInfo(this)">View Order</button>
                </div>
            </div>
        </div>
    <?php endforeach;
}

function findProduct($adminView)
{

    $keyword = htmlspecialchars($_POST['product_keyword'], ENT_QUOTES);

    $data = $adminView->searchProduct($keyword);

    loadProducts(NULL, $data);
}

function addGame($adminCtrl)
{
    $data = getPostData();

    // var_dump($data);
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

    $data = getPostData();

    try {
        $adminCtrl->updateGame($data);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
}

function getPostData()
{
    $flag_names = ['add_game', 'update_game'];

    $data = [];
    foreach ($_POST as $name => $value) {
        if (in_array($name, $flag_names)) continue;
        $data[$name] = $value;
    }

    if (!empty($_FILES['game_images'] ?? NULL)) {
        foreach ($_FILES['game_images'] as $name => $value) {
            $data["image"][$name] = $value;
        }
    }

    return $data;
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

function archiveData($adminCtrl)
{

    $id = $_POST['archive_data'];
    $tbl = $_POST['tbl'];

    if ($tbl == 'products') {
        $adminCtrl->archiveGame($id);
        echo "Product has been archived successfully";
    }
}

function getOrderInfo($adminView)
{

    $order_id = $_GET['order_id'];

    $data = $adminView->fetchOrderInfo($order_id);

    echo json_encode($data);
}

function updateOrderStatus($adminCtrl)
{

    $order_id = $_POST['update_order'];
    $order_status = $_POST['order_status'];
    try {
        $adminCtrl->updateOrderStatus($order_id, $order_status);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }

    echo "success";
}

function checkDuplicateProducts($adminView)
{

    $keyword = $_GET['product_name'];
    $action = $adminView->searchProduct($keyword);

    if (count($action) > 0) {
        echo 'duplication';
    }
}

function loadCategories($data = NULL, $counter = 1)
{

    foreach ($data as $category) :
    ?>
        <tr>
            <td><?= $counter++ ?></td>
            <td><?= $category['category_name'] ?></td>
            <td>
                <button class="btn btn-warning" onclick="loadCategoryInfo(this.value)" value="<?= $category['id'] ?>" data-bs-toggle="modal" data-bs-target="#add_modal">Edit</button>
                <button class="btn btn-danger" onclick="confirmRemoveContent(this.value)" value="<?= $category['id'] ?>" data-bs-toggle="modal" data-bs-target="#verify_modal">Delete</button>
            </td>
        </tr>
    <?php endforeach;
}

function loadPlatforms($data = NULL, $counter = 1)
{

    foreach ($data as $platform) :
    ?>
        <tr>
            <td><?= $counter++ ?></td>
            <td><?= $platform['platform_name'] ?></td>
            <td>
                <button class="btn btn-warning" onclick="loadPlatformInfo(this.value)" value="<?= $platform['id'] ?>" data-bs-toggle="modal" data-bs-target="#add_modal">Edit</button>
                <button class="btn btn-danger" onclick="confirmRemoveContent(this.value)" value="<?= $platform['id'] ?>" data-bs-toggle="modal" data-bs-target="#verify_modal">Delete</button>
            </td>
        </tr>
    <?php endforeach;
}

function loadCategoriesByPage($adminView)
{

    $limit = 10;

    $page_number = $_GET['category_page']  ?? $_POST['page_number'];
    $offset = $page_number * $limit;

    try {
        $category_data = $adminView->fetchCategories($offset, $limit);
    } catch (Exception $e) {
        echo "ERROR: $e";
    }
    $counter = $offset + 1;
    loadCategories($category_data, $counter);
}

function loadPlatformsByPage($adminView)
{
    $limit = 10;

    $page_number = $_GET['platform_page'] ?? $_POST['page_number'];
    $offset = $page_number * $limit;

    $platform_data = $adminView->fetchPlatforms($offset, $limit);
    $counter = $offset + 1;
    loadPlatforms($platform_data, $counter);
}

function getCategory($adminView)
{

    if (isset($_GET['category_id'])) {
        $category_id = $_GET['category_id'];

        $data = $adminView->fetchCategory($category_id);
        echo json_encode($data);
    } else {
        $keyword = $_GET['category_keyword'];
        $action = $adminView->fetchCategories(0, 10, "category_name LIKE '%$keyword%'");
        loadCategories($action);
    }
}

function searchDuplicateContent($adminView)
{

    $keyword = $_GET['content_keyword'];

    $action = $adminView->fetchCategories(0, NULL, "category_name LIKE '%$keyword%'");

    if (count($action) > 0) {
        echo 'duplicate';
    }
}

function addContent($adminCtrl)
{

    $tbl = $_POST['content_table'];
    $input_value = $_POST['input_name'];

    if ($tbl == 'category') {
        $category_desc = $_POST['category_description'];
        foreach ($_FILES['bg_image'] as $name => $value) {
            $bg_image["bg_image"][$name] = $value;
        }
        $adminCtrl->addCategory($input_value, $category_desc, $bg_image);
    } else {
        $adminCtrl->addPlatform($input_value);
    }
}

function getPlatform($adminView)
{

    if (isset($_GET['platform_id'])) {
        $platform_id = $_GET['platform_id'];

        $data = $adminView->fetchPlatform($platform_id);
        echo $data[0]['platform_name'];
    } else {
        $keyword = $_GET['platform_keyword'];
        $action = $adminView->fetchPlatforms(0, 10, "platform_name LIKE '%$keyword%'");
        loadPlatforms($action);
    }
}

function updateContent($adminCtrl, $adminView)
{

    $content_id = $_POST['content_id'];
    $content_value = $_POST['input_field'];
    $table = $_POST['content_table'];

    if ($table == 'category') {
        $bg_image = $_FILES['bg_image'] ?? NULL;
        $description = $_POST['category_description'];

        $adminCtrl->reformCategory($content_value, $bg_image, $description, $content_id);
        loadCategoriesByPage($adminView);
    } else {
        $adminCtrl->updatePlatform($content_value, $content_id);
        loadPlatformsByPage($adminView);
    }
}

function getContentInfo($adminView)
{

    $content_id = $_GET['confirm_delete'];
    $content = $_GET['content_table'];

    if ($content == 'category') {
        $data = $adminView->fetchCategory($content_id);
    } else {
        $data = $adminView->fetchPlatform($content_id);
    }
    echo $data[0]["{$content}_name"];
}

function removeContent($adminCtrl, $adminView)
{
    $content_id = $_POST['content_delete_id'];
    $content = $_POST['content_table'];

    if ($content == 'category') {
        $adminCtrl->deleteCategory($content_id);
        loadCategoriesByPage($adminView);
    } else {
        $adminCtrl->deletePlatform($content_id);
        loadPlatformsByPage($adminView);
    }
}

function reloadPagination($adminView)
{

    $content_header = $_GET['reload_pagination'];
    if ($content_header == 'category_') {
        $data = $adminView->fetchCategories();
    } else {
        $data = $adminView->fetchPlatforms();
    }

    $number_of_items = 10;
    $pages = ceil(count($data) / $number_of_items);
    ?>
    <?php for ($i = 1; $i <= $pages; $i++) {
    ?>
        <li class="page-item">
            <button class="number_page page-link <?= ($i == 1) ? 'active' : '' ?>" data-page-number="<?= ($i - 1) ?>" onclick="changePage(this)"><?= $i ?></button>
        </li>
    <?php
    }
    ?>
    </ul>
<?php

}
