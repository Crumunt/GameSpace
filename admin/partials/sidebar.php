<?php
session_start();

$user_id = $_SESSION['user_id'] ?? NULL;
if($user_id == NULL) {
    header('location: ../index.php?error=UserNotLoggedIn');
    exit();
}

$page = basename($_SERVER['PHP_SELF'], ".php");

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GameSpace</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/sidebar-footer.css">
    <script src="../js/sidebar.js" defer></script>
    <!-- <script src="../js/pagination.js" defer></script> -->
    <script src="../js/admin.js" defer></script>
    <!-- CDN LINKS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>

<body class="bg-dark">
    <div class="wrapper d-flex">
        <aside id="sidebar" class="">
            <div class="d-flex">
                <button id="toggle-button">
                    <i class='bx bx-grid-alt fs-3'></i>
                </button>
                <div class="sidebar-logo">
                    <a href="index.php">GameSpace</a>
                </div>
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a href="index.php" class="sidebar-link d-flex align-items-center">
                       <i class='bx bx-home-alt-2 fs-4'></i>
                        <span class="fs-5">Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="manage-products.php" class="sidebar-link d-flex align-items-center">
                        <i class='bx bx-game fs-4'></i>
                        <span class="fs-5">Manage Products</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="manage-orders.php" class="sidebar-link d-flex align-items-center">
                        <i class='bx bx-package fs-4' ></i>
                        <span class="fs-5">Manage Orders</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="manage-categories.php" class="sidebar-link d-flex align-item-center">
                        <i class='bx bx-category fs-4'></i>
                        <span class="fs-5">Manage Categories</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="manage-platforms.php" class="sidebar-link d-flex align-item-center">
                        <i class='bx bx-devices fs-4'></i>
                        <span class="fs-5">Manage Platforms</span>
                    </a>
                </li>
                <li class="sidebar-item mt-5">
                    <a href="" class="sidebar-link has-dropdown collapsed d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#user_collapse" aria-expanded="false" aria-controls="user_collapse">
                        <i class='bx bx-user-circle fs-4'></i>
                        <span class="fs-5"><?= $_SESSION['username'] ?></span>
                    </a>
                    <ul id="user_collapse" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="../form_handlers/logout.php" class="sidebar-link">Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </aside>
        <div class="main bg-dark">