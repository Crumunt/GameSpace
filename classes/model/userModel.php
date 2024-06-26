<?php
class User extends Dbh
{

	private function executeQuery($stmt, ...$values)
	{

		if (!$stmt->execute($values)) {
			header("location: ../index.php?error=SomethingWentWrong");
			exit();
		}

		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		return $results;
	}

	protected function getGames($where = NULL, $limit = NULL)
	{

		$sql = "SELECT * FROM product_view";

		if ($where != NULL) {
			$sql .= " WHERE $where";
		}

		$sql .= " GROUP BY id";

		if ($limit != NULL) {
			$sql .= " LIMIT $limit";
		}


		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt);
	}

	protected function getGameCategories($product_id)
	{

		$sql = "SELECT category_name FROM product_view WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $product_id);
	}

	protected function getGamePlatforms($product_id)
	{
		$sql = "SELECT platform_id, platform_name FROM game_platform_view WHERE product_id = ?";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $product_id);
	}

	protected function getPlaform($platform_id)
	{
		$sql = "SELECT id, platform_name FROM tbl_platforms WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $platform_id);
	}

	protected function getGame($id)
	{

		$sql = "SELECT * FROM tbl_products WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $id);
	}

	protected function getRandomGames($limit = NULL)
	{

		$sql = "SELECT * FROM product_view";

		if ($limit != NULL) {
			$sql .= " WHERE sold_count > 0 GROUP BY id ORDER BY sold_count ASC, RAND()";
			$sql .= " LIMIT $limit";
		}

		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt);
	}

	protected function getCategories()
	{
		$sql = "SELECT * FROM tbl_categories";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt);
	}

	protected function getCartItems($user_id)
	{
		$sql = "SELECT * FROM cart_view WHERE user_id = ?";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $user_id);
	}

	protected function addItemToCart($product_id, $quantity, $user_id, $platform_id)
	{
		$find_existing_query = "SELECT * FROM tbl_cart WHERE product_id = ? AND user_id = ? AND platform_id = ?";
		$find_stmt = $this->connect()->prepare($find_existing_query);

		$find_results = $this->executeQuery($find_stmt, $product_id, $user_id, $platform_id);

		if ($find_results) {
			$sql = "UPDATE tbl_cart SET quantity = quantity + ? WHERE product_id = ? AND user_id = ? AND platform_id = ?";
		} else {
			$sql = "INSERT INTO tbl_cart (quantity,product_id,user_id, platform_id) VALUES (?,?,?,?)";
		}

		$stmt = $this->connect()->prepare($sql);

		$this->executeQuery($stmt, $quantity, $product_id, $user_id, $platform_id);

		return 'Product has been added to cart!';
	}

	protected function getOrderInfo($cart_id)
	{
		$sql = "SELECT * FROM tbl_cart INNER JOIN tbl_products ON tbl_cart.product_id = tbl_products.id WHERE tbl_cart.id = ?";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $cart_id);
	}

	protected function purchaseGame($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address, $platform_id)
	{

		echo "Check your email to verify your purchase.";
		try {
			$sql = "INSERT INTO tbl_orders(customer_id, receipient_name, product_id, quantity, order_total, order_address, platform_id) VALUES (?,?,?,?,?,?,?)";
			$stmt = $this->connect()->prepare($sql);

			$this->executeQuery($stmt, $user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address, $platform_id);

			$sold_sql = "UPDATE tbl_products SET sold_count = sold_count + ? WHERE id = ?";
			$sold_stmt = $this->connect()->prepare($sold_sql);

			$this->executeQuery($sold_stmt, $quantity, $product_id);
		} catch (Exception $e) {
			echo "ERROR: $e";
		}
	}

	protected function completeOrder($order_id)
	{
		$sql = "UPDATE tbl_orders SET date_completed = NOW() WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		$this->executeQuery($stmt, $order_id);
	}

	protected function getCompletedOrders($user_id)
	{
		$sql = "SELECT * FROM order_view WHERE customer_id = ? AND order_completed IS NOT NULL";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $user_id);
	}

	protected function removeItemFromCart($id, $user_id)
	{
		$sql = "DELETE FROM tbl_cart WHERE id = ? AND user_id = ?";
		$stmt = $this->connect()->prepare($sql);

		$this->executeQuery($stmt, $id, $user_id);
	}

	protected function getOrders($user_id)
	{
		$sql = "SELECT * FROM order_view WHERE customer_id = ? AND order_completed IS NULL";
		$stmt = $this->connect()->prepare($sql);

		return $this->executeQuery($stmt, $user_id);
	}

	protected function setOrderComplete($order_id)
	{
		$sql  = "UPDATE tbl_orders SET order_completed = NOW() WHERE id = ?";
		$stmt = $this->connect()->prepare($sql);

		$this->executeQuery($stmt, $order_id);
	}

	protected function setCartItemQuantity($cart_id, $quantity, $user_id)
	{
		$sql = "UPDATE tbl_cart SET quantity = ? WHERE id = ? AND user_id = ?";
		$stmt = $this->connect()->prepare($sql);

		$this->executeQuery($stmt, $quantity, $cart_id, $user_id);
	}

	protected function sendConcern($concern_header, $concern_body = NULL, $user_id)
	{
		try {
			$sql = "INSERT INTO tbl_messages(concern_header, concern_body, user_id) VALUES (?,?,?)";
			$stmt = $this->connect()->prepare($sql);

			$this->executeQuery($stmt, $concern_header, $concern_body, $user_id);
		} catch (Exception $e) {
			echo "ERROR: $e";
		}
		echo "DONE";
	}
}
