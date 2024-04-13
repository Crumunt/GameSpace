<?php
class User extends Dbh {

	protected function getGames($page = 0, $limit = 10) {

		$sql = "SELECT * FROM tbl_products LIMIT $page, $limit";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute()) {
			// HEAD TO LOCATION
			echo "SOMETHING WENT WRONG";
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getGame($id) {

		$sql = "SELECT * FROM tbl_products WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute([$id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

		return $results;

	}

	protected function getRandomGames($limit = NULL) {

		$sql = "SELECT * FROM tbl_products ORDER BY RAND()";
		
		if($limit != NULL) {
			$sql .= " LIMIT $limit";
		}
		
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute()) {
			// HEAD TO LOCATION
			echo "SOMETHING WENT WRONG";
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

		return $results;
		
	}

	protected function getCategories($page = 0, $limit = 10) {
		$sql = "SELECT * FROM tbl_categories LIMIT $page, $limit";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getPlatforms($page = 0) {
		$sql = "SELECT * FROM tbl_platforms LIMIT $page, 10";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getCartItems() {
		$sql = "SELECT * FROM tbl_cart";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getWishlistItems() {
		$sql = "SELECT * FROM tbl_wishlists";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function addItemToCart($id, $quantity) {

		$sql = "INSERT INTO tbl_cart(`id`,`quantity`,`user_id`) VALUES (?,?,?)";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute([$id, $quantity])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

	}

	protected function buyItem() {

	}

}