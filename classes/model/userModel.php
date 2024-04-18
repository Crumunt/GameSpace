<?php
class User extends Dbh
{

	protected function getGames($where = NULL, $limit = NULL)
	{

		$sql = "SELECT * FROM product_view";

		if($where != NULL) {
			$sql .= " WHERE $where";
		}

		$sql .= " GROUP BY id";
		
		if($limit != NULL) {
			$sql .= " LIMIT $limit";
		}


		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute()) {
			// HEAD TO LOCATION
			echo "SOMETHING WENT WRONG";
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getGameCategories($product_id) {

		$sql = "SELECT category_name FROM product_view WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute([$product_id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getGamePlatforms($product_id) {
		$sql = "SELECT platform_name FROM game_platform_view WHERE product_id = ?";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute([$product_id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;

	}

	protected function getGame($id)
	{

		$sql = "SELECT * FROM tbl_products WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute([$id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

		return $results;
	}

	protected function getRandomGames($limit = NULL)
	{

		$sql = "SELECT * FROM tbl_products ORDER BY RAND()";

		if ($limit != NULL) {
			$sql .= " LIMIT $limit";
		}

		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute()) {
			// HEAD TO LOCATION
			echo "SOMETHING WENT WRONG";
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

		return $results;
	}

	protected function getCategories($page = 0, $limit = 10)
	{
		$sql = "SELECT * FROM tbl_categories LIMIT $page, $limit";
		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getCartItems($user_id)
	{
		$sql = "SELECT tbl_cart.id as cart_id, product_id, SUM(quantity) as quantity, product_name, product_thumbnail FROM tbl_cart INNER JOIN tbl_products ON tbl_cart.product_id = tbl_products.id WHERE user_id = $user_id GROUP BY product_id";
		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getWishlistItems()
	{
		$sql = "SELECT * FROM tbl_wishlists";
		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute()) {
			// HEAD TO LOCATION
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function addItemToCart($id, $quantity, $user_id)
	{

		$sql = "INSERT INTO tbl_cart (product_id,quantity,user_id) VALUES (?,?,?)";
		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute([$id, $quantity, $user_id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		return 'Product has been added to cart!';
	}

	protected function purchaseGame($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address)
	{

		try {
			$sql = "INSERT INTO tbl_orders(customer_id, receipient_name, product_id, quantity, order_total, order_address) VALUES (?,?,?,?,?,?)";
			$stmt = $this->connect()->prepare($sql);

			if (!$stmt->execute([$user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address])) {
				header("location: ../cart.php?error=SomethingWentWrong");
				exit();
			}
		} catch (Exception $e) {
			echo "ERROR: $e";
		}

		return "Check your email to verify your purchase.";
	}

	protected function completeOrder($order_id) {
		$sql = "UPDATE tbl_orders SET date_completed = NOW() WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute([$order_id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}
		
	}

	protected function removeItemFromCart($product_id, $user_id)
	{

		$sql = "DELETE FROM tbl_cart WHERE product_id = ? AND user_id = ?";
		$stmt = $this->connect()->prepare($sql);

		if (!$stmt->execute([$product_id, $user_id])) {
			header("location: ../user/cart.php");
			exit();
		}
	}

	function getOrders($user_id) {
		$sql = "SELECT * FROM order_view WHERE customer_id = ?";
		$stmt = $this->connect()->prepare($sql);

		if(!$stmt->execute([$user_id])) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

		return $results;
	}
}
