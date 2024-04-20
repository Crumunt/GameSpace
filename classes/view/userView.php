<?php
class UserView extends User
{

	public function getProducts($where = NULL, $limit = NULL)
	{
		$data = $this->getGames($where, $limit);
		return $data;
	}

	public function getRandomProducts($count)
	{
		$data = $this->getRandomGames($count);
		return $data;
	}

	public function fetchCategories()
	{
		$data = $this->getCategories();
		return $data;
	}

	public function fetchGameCategories($id)
	{
		$data = $this->getGameCategories($id);
		return $data;
	}

	public function fetchGamePlatforms($id)
	{
		$data = $this->getGamePlatforms($id);
		return $data;
	}

	public function fetchPlatform($platform_id) {
		$data = $this->getPlaform($platform_id);
		return $data;
	}

	public function fetchGameInfo($id)
	{
		$data = $this->getGame($id);
		return $data;
	}

	public function fetchOrderInfo($cart_id)
	{
		$data = $this->getOrderInfo($cart_id);
		return $data;
	}

	public function fetchCartItems($user_id)
	{
		$data = $this->getCartItems($user_id);
		return $data;
	}

	public function fetchOrders($user_id)
	{
		$data = $this->getOrders($user_id);
		return $data;
	}
}
