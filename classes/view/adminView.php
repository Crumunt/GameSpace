<?php

class AdminView extends Admin
{

    public function showProducts()
    {
        $data = $this->showGames();
        return $data;
    }

    public function fetchProductInfo($product_id) {
        $data = $this->getProductInfo($product_id);
        return $data;
    }

    public function fetchProductCount() {
        $data = $this->getProductCount();
        return $data;
    }

    public function searchProduct($keyword) {
        try {
            $data = $this->searchGames("%$keyword%");
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
        return $data;
    }

    public function fetchCategories($offset = 0, $limit = NULL, $where = NULL) {
        $data = $this->getCategories($offset, $limit, $where);
        return $data;
    }

    public function fetchCategory($id) {
        $data = $this->getCategory($id);
        return $data;
    }

    public function fetchPlatforms($offset = 0, $limit = NULL, $where = NULL) {
        $data = $this->getPlatforms($offset, $limit, $where);
        return $data;
    }

    public function fetchPlatform($platform_id) {
        $data = $this->getPlatform($platform_id);
        return $data;
    }

    public function fetchOrders($limit = NULL) {
        $data = $this->getOrders($limit);
        return $data;
    }

    public function fetchPendingOrders() {
        $data = $this->getOrderCount();
        return $data;
    }

    public function fetchCompletedOrders() {
        $data = $this->getCompletedOrderCount();
        return $data;
    }

    public function fetchUserCount() {
        $data = $this->getUserCount();
        return $data;
    }

    public function fetchMonthlyRegistrations() {
        $data = $this->getMonthlyUserRegistrations();
        return $data;
    }

    public function fetchPopularCategories() {
        $data = $this->getPopularCategories();
        return $data;
    }

    public function fetchOrderInfo($order_id) {
		$data = $this->getOrderInfo($order_id);
		return $data;
	}
}
