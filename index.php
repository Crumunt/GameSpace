<?php
include "classes/dbh.php";
include "classes/model/userModel.php";
include "classes/view/userView.php";
$userView = new UserView();
$data = $userView->getProducts(null, 12);
$carouselData = $userView->getRandomProducts(3);
?>

<?php include "user/partials/sidebar.php" ?>
<!-- CAROUSEL START -->
<div class="container mt-5">


  <div id="carouselExampleAutoplaying" class="carousel slide rounded-5 overflow-hidden" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <?php
      $carouselCounter = 1;
      foreach ($carouselData as $carouselItem) :
      ?>
        <div class="carousel-item <?= ($carouselCounter == 1) ? 'active' : '' ?>">
          <img src=<?= "{$carouselItem['product_thumbnail']}" ?> class="d-block w-100 h-100" alt="..." style="filter: brightness(0.5);">
          <div class="carousel-caption top-0 mt-lg-4 mt-sm-0">
            <h5 class="text-uppercase display-lg-5 display-sm-5 mt-lg-5 mt-sm-0">TOP SELLING GAMES</h5>
            <p class="fs-1 fs-sm-5 mt-lg-5 mt-sm-4 fw-bolder text-capitalize text-truncate"><?= $carouselItem['product_name'] ?></p>
            <a href="user/view_game.php?product_id=<?= $carouselItem['id'] ?>" class="btn btn-primary px-4 py-2 fs-5 mt-5">View</a>
          </div>
        </div>
      <?php
        $carouselCounter++;
      endforeach;
      ?>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <!-- CAROUSEL END -->

  <!-- CARDS START -->
  <div class="row my-5 g-3">
    <h1 class="text-center text-white text-uppercase fw-bolder">Products</h1>
    <?php foreach ($data as $gameDetails) : ?>
      <div class="col-lg-3 col-md-6 col-sm-10 d-flex justify-content-center">
        <div class="card preview__card text-white shadow" style="width: 18rem;">
          <img src=<?= "" . $gameDetails['product_thumbnail'] . "" ?> class="card-img-top mh-50 object-fit-cover" alt="...">
          <div class="card-body">
            <h5 class="card-title text-truncate"><?= $gameDetails['product_name'] ?></h5>
            <div class="card-text product__preview"><?= $gameDetails['product_description'] ?></div>
            <a href="user/view_game.php?product_id=<?= $gameDetails['id'] ?>" class="btn btn-outline-light mt-3">View Product</a>
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
  <div class="row">
    <a href="user/games.php" class="btn btn-light w-50 mx-auto mt-5">View More</a>
  </div>
  <!-- CARDS END -->

  <!-- BANNER START -->
  <?php $banner__product = $userView->getRandomProducts(1)  ?>
  <div class="card my-5 discount__card shadow" style="">
    <div class="row g-0">
      <div class="col-md-4">
        <img src=<?= "{$banner__product[0]['product_thumbnail']}" ?> class="img-fluid rounded-start h-100" alt="...">
      </div>
      <div class="col-md-8">
        <div class="card-body text-white discount__body">
          <h5 class="card-title fw-bolder fs-2"><?= $banner__product[0]['product_name'] ?> </h5>
          <div class="card-text discount__preview mb-3"><?= $banner__product[0]['product_description'] ?></div>
          <a href="user/view_game.php?product_id=<?= $banner__product[0]['id'] ?>" class="btn btn-outline-info">Get Here</a>
        </div>
      </div>
    </div>
  </div>
  <!-- BANNER END -->
</div>

<?php include "user/partials/footer.php"; ?>