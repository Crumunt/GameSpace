<?php 
session_start();
$page = basename($_SERVER['PHP_SELF'], ".php");
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>GameSpace</title>
	<link rel="stylesheet" href="<?= ($page == 'index') ? '' : "../" ?>css/sidebar-footer.css">
	<link rel="stylesheet" href="<?= ($page == 'index') ? '' : "../" ?>css/page_1_&_2_&_5.css">
	<script src="<?= ($page == 'index') ? '' : '../' ?>js/sidebar.js" defer></script>
	<?php
	$included_pages = ['index', 'featured', 'view_game'];
	if (!in_array($page, $included_pages)) {
	?>
		<link rel="stylesheet" href="../css/<?= ($page == 'categories') ? 'page3' : 'page4' ?>.css">
	<?php
	}
	?>

	<!-- CDN LINKS -->
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
					<a href="<?= ($page == 'index') ? '' : '../' ?>index.php">GameSpace</a>
				</div>
			</div>
			<ul class="sidebar-nav">
				<li class="sidebar-item">
					<a href="<?= ($page == 'index') ? '' : '../' ?>index.php" class="sidebar-link d-flex align-items-center">
						<i class='bx bxs-dashboard fs-4'></i>
						<span class="fs-5">Home</span>
					</a>
				</li>
				<li class="sidebar-item">
					<a href="" class="sidebar-link has-dropdown collapsed d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#store_sub_items" aria-expanded="false" aria-controls="store_sub_items">
						<i class='bx bx-store-alt fs-4'></i>
						<span class="fs-5">Store</span>
					</a>
					<ul id="store_sub_items" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
						<li class="sidebar-item">
							<a href="<?= ($page == 'index') ? 'user/' : '' ?>featured.php" class="sidebar-link">Featured</a>
						</li>
						<li class="sidebar-item">
							<a href="<?= ($page == 'index') ? 'user/' : '' ?>categories.php" class="sidebar-link">Categories</a>
						</li>
						<li class="sidebar-item">
							<a href="<?= ($page == 'index') ? 'user/' : '' ?>games.php" class="sidebar-link">All Games</a>
						</li>
					</ul>
				</li>
				<li class="sidebar-item">
					<a href="<?= ($page == 'index') ? 'user/' : '' ?>libary.php" class="sidebar-link d-flex align-items-center">
						<i class='bx bx-library fs-4'></i>
						<span class="fs-5">Library</span>
					</a>
				</li>
				<li class="sidebar-item">
					<a href="" class="sidebar-link d-flex align-items-center">
						<i class='bx bx-cart fs-4'></i>
						<span class="fs-5">Cart</span>
					</a>
				</li>
				<li class="sidebar-item">
					<a href="" class="sidebar-link d-flex align-items-center">
						<i class='bx bxs-truck fs-4'></i>
						<span class="fs-5">Orders</span>
					</a>
				</li>
				<li class="sidebar-item mt-5">
					<a href="" class="sidebar-link has-dropdown collapsed d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#user_collapse" aria-expanded="false" aria-controls="user_collapse">
						<i class='bx bx-user-circle fs-4'></i>
						<span class="fs-5"><?= $_SESSION['username'] ?></span>
					</a>
					<ul id="user_collapse" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
						<li class="sidebar-item">
							<a href="<?= ($page == 'index') ? 'user/' : '' ?>featured.php" class="sidebar-link">Settings</a>
						</li>
						<li class="sidebar-item">
							<a href="<?= ($page == 'index') ? 'user/' : '' ?>categories.php" class="sidebar-link">Logout</a>
						</li>
					</ul>
				</li>
			</ul>
		</aside>
		<div class="main bg-dark">