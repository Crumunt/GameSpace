<?php

class AdminView extends Admin
{

    public function showProducts()
    {
        $data = $this->showGames();
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
}
