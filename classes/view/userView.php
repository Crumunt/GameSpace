<?php
class UserView extends User {

	public function getProducts($page, $limit) {
		$data = $this->getGames($page, $limit);
		return $data;
	}

	public function getRandomProducts($count) {
		$data = $this->getRandomGames($count);
		return $data;
	}

	public function fetchCategories() {
		$data = $this->getCategories();
		return $data;
	}

	public function fetchGameInfo($id) {
		$data = $this->getGame($id);
		return $data;
	}

}