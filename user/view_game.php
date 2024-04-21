<?php
include "../classes/dbh.php";
include "../classes/model/userModel.php";
include "../classes/view/userView.php";
include "partials/sidebar.php";

$id = $_GET['product_id'] ?? NULL;
// $id = 10141;

if ($id == NULL) {
  header("location: ../index.php");
  exit();
}

$userView = new UserView();

$gameData = $userView->fetchGameInfo($id);
?>

<div class="container-sm">
  <div class="row mt-5 border-bottom pb-3 d-flex justify-content-center">
    <div class="col-lg-5 col-md-10 mx-auto">
      <?php
      $src = (str_contains($gameData[0]['product_thumbnail'], 'https') == true) ? $gameData[0]['product_thumbnail'] : "../assets/thumbnails/" . $gameData[0]['product_thumbnail'];
      ?>
      <div id="product_thumbnail_wrapper" class="overflow-hidden rounded-4 object-fit-cover">
        <img src="<?= $src ?>" alt="Product Image" class="img-fluid w-100 h-100">
      </div>
    </div>
    <div class="col-lg-5 col-md-10 mx-auto d-flex flex-column justify-content-between">
      <div class="overview">
        <h2 title="<?= $gameData[0]['product_name'] ?>" class="text-truncate text-white fw-bolder">
          <?= $gameData[0]['product_name'] ?>
        </h2>
        <span class="fs-5 text-sm fw-normal text-white my-5">Price: $<b><?= number_format($gameData[0]['price'], 2) ?></b></span>
      </div>
      <!-- FORM START -->
      <div class="form justify-self-end text-white">

        <!-- PLATFORM SELECT -->
        <div class="form-group my-3">
          <label for="" class="fw-bold text-uppercase">Platform</label>
          <select name="" id="game_platform" class="form-select w-50">
            <?php
            $platform_data = $userView->fetchGamePlatforms($gameData[0]['id']);
            foreach ($platform_data as $platform) : ?>
              <option value="<?= $platform['platform_id'] ?>"><?= $platform['platform_name'] ?></option>
            <?php endforeach; ?>
          </select>
        </div>

        <!-- QUANTITY CONTROL -->
        <div class="form-group mb-3">
          <label for="" class="form-label text-white fw-bold text-uppercase">Quantity</label>
          <input type="number" name="quantity" value="1" min="1" id="quantity" class="form-control w-25">
        </div>

        <!-- ACTION BUTTONS -->
        <div class="button-group mb-3">
          <button value=<?= "{$gameData[0]['id']}" ?> onclick="addToCart(this)" class="btn btn-warning " data-bs-toggle="modal" data-bs-target="#confirmModal">
            Add to Cart
          </button>
          <button class="btn btn-primary" value=<?= "{$gameData[0]['id']}" ?> onclick="redirectCheckout(this.value)">Buy Now</button>
        </div>
      </div>
    </div>
  </div>
  <div class="row">

    <div class="game_tags mt-5">
      <!-- TAGS START -->
      <p class="text-white text-uppercase fw-bolder">Tags</p>
      <div class="tags d-flex gap-2 align-items-center flex-wrap">
        <?php
        $cateogry_data = $userView->fetchGameCategories($gameData[0]['id']);
        foreach ($cateogry_data as $game_category) :
        ?>
          <a href="games.php?category=<?= $game_category['category_name'] ?>" class="btn btn-warning p-1 rounded-1"><?= $game_category['category_name'] ?></a>
        <?php endforeach; ?>
      </div>
    </div>

    <h1 class="my-3 text-white fw-bolder">Description</h1>
    <div class="text-white fs-5"><?= $gameData[0]['product_description'] ?></div>
  </div>

  <div class="row pb-5">
    <h1 class="text-white text-uppercase fw-bolder my-5">Game Preview</h1>
    <div class="row">
      <?php foreach (unserialize($gameData[0]['snapshots']) as $snapshot) : ?>
        <?php
        $src = (str_contains($snapshot, 'https') == true) ? $snapshot : "../assets/" . $snapshot;
        ?>
        <div class="col-lg-4 col-md-6 col-sm-10 mb-5">
          <div class="card bg-dark border text-white product__snapshot w-75 h-100 mx-auto">
            <img src="<?= $src ?>" class="card-img w-100 h-100" alt="...">
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</div>

<!-- MODAL -->
<?php
include "partials/modal.php";


include "partials/footer.php";
?>