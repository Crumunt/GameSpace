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
      <img src=<?= "{$gameData[0]['product_thumbnail']}" ?> alt="Product Image" class="img-fluid w-100 rounded-4">
    </div>
    <div class="col-lg-5 col-md-10 mx-auto d-flex flex-column justify-content-between">
      <div class="overview">
        <h1 class="text-white fw-bolder"><?= $gameData[0]['product_name'] ?></h1>
        <!-- TAGS START -->
        <p class="text-white text-uppercase fw-bolder">Tags</p>
        <div class="tags d-flex gap-2 align-items-center flex-wrap">
          <?php foreach (unserialize($gameData[0]['game_category']) as $tag) : ?>
            <span class="btn btn-warning p-1 rounded-1"><?= $tag ?></span>
          <?php endforeach; ?>
        </div>
        <!-- PLATFORMS START -->
        <p class="text-white text-uppercase fw-bolder mt-3">platforms</p>
        <div class="platforms d-flex flex-wrap gap-2 mb-2">
          <?php foreach (unserialize($gameData[0]['product_platforms']) as $platform) : ?>
            <span class="btn btn-danger p-1 rounded-1"><?= $platform ?></span>
          <?php endforeach; ?>
        </div>
      </div>
      <!-- FORM START -->
      <form action="" class="justify-self-end">
        <div class="form-group mb-3">
          <label for="" class="form-label text-white fw-bold text-uppercase">Quantity</label>
          <input type="number" name="" value="1" min="1" id="" class="form-control w-25">
        </div>
        <div class="button-group mb-3">
          <button class="btn btn-warning">Add to Cart</button>
          <button class="btn btn-primary">Buy Now</button>
        </div>
      </form>
    </div>
  </div>
  <div class="row">
    <h1 class="my-3 text-white fw-bolder">Description</h1>
    <div class="text-white fs-5"><?= $gameData[0]['product_description'] ?></div>
  </div>

  <div class="row pb-5">
    <h1 class="text-white text-uppercase fw-bolder my-5">Game Preview</h1>
    <!-- <div class="card-group gap-2"> -->
    <div class="row">
      <?php foreach (unserialize($gameData[0]['snapshots']) as $snapshot) : ?>
        <div class="col-lg-4 col-md-6 col-sm-10 mb-5">
          <div class="card bg-dark border text-white product__snapshot w-75 h-100 mx-auto">
            <img src="<?= $snapshot ?>" class="card-img w-100 h-100" alt="...">
          </div>
        </div>
      <?php endforeach; ?>
    </div>
    <!-- </div> -->
  </div>
</div>

<?php include "partials/footer.php"; ?>