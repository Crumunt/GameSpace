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

    public function fetchCategories() {
        $data = $this->getCategories();
        return $data;
    }

    public function fetchPlatforms() {
        $data = $this->getPlatforms();
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

    public function fetchOrderInfo($order_id) {
		$data = $this->getOrderInfo($order_id);
		return $data;
	}
}
