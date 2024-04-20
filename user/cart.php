<?php

require "../classes/dbh.php";
require "../classes/model/userModel.php";
require "../classes/view/userView.php";
include "partials/sidebar.php";

$userView = new UserView();

$user_id = $_SESSION['user_id'] ?? NULL;

if ($user_id == NULL) {
    header("location: ../login.php");
    exit();
}

$data = $userView->fetchCartItems($user_id);

?>
<div class="container-sm" style="min-height: 100svh;">
    <h1 class="text-start">Cart</h1>
    <div id="cart_wrapper">
        <?php foreach ($data as $cartItem) : ?>
            <div class="card text-white mb-3 w-75 mx-auto" style="background-color: #2C2E34">
                <div class="row g-0">
                    <div class="col-md-4" style="height: 203px;">
                        <?php
                        $src = (str_contains($cartItem['product_thumbnail'], 'https')) ? $cartItem['product_thumbnail'] : "../assets/thumbnails/{$cartItem['product_thumbnail']}";
                        ?>
                        <img src="<?= $src ?>" class="img-fluid object-fit-cover rounded-start w-100 h-100" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body d-flex justify-content-between flex-column h-100">
                            <h5 class="card-title fw-bolder fs-2"><?= $cartItem['product_name'] ?></h5>
                            <div class="card-text">
                                <div class="platform_wrapper">
                                    <p>Platform: <?= $cartItem['platform_name'] ?></p>
                                </div>
                                <div class="form-group d-flex gap-2 align-items-center">
                                    <label for="" class="">Quantity: </label>
                                    <span id="cart_quantity_<?= $cartItem['cart_id'] ?>"><?= $cartItem['quantity'] ?></span>
                                    <button data-cart-id="<?= $cartItem['cart_id'] ?>" aria-label="minus" class="btn btn-outline-light" onclick="updateQuantity(this)"><i class='bx bx-minus'></i></button>
                                    <button data-cart-id="<?= $cartItem['cart_id'] ?>" aria-label="plus" class="btn btn-outline-light" onclick="updateQuantity(this)"><i class='bx bx-plus'></i></button>
                                </div>
                                <p class="card-text">
                                <div class="button-group d-flex flex-wrap gap-2">
                                    <button class="btn btn-warning" data-bs-toggle="modal" value="<?= $cartItem['product_name'] ?>" data-cart-id="<?= $cartItem['cart_id'] ?>" data-bs-target="#confirmationModal" onclick="confirmDelete(this)">Remove Item</button>
                                    <a class="btn btn-success" href="checkout.php?cart_id=<?= $cartItem['cart_id'] ?>">Buy Now</a>
                                </div>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<?php
include "partials/modal.php";

include "partials/footer.php";

?>