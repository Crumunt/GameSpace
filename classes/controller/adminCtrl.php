<?php

class AdminCtrl extends Admin
{

    public function addProduct($data)
    {
        $game_data = $this->getGameData($data);

        $this->setProduct($game_data);
    }

    public function updateGame($data)
    {
        try {
            $game_data = $this->getGameData($data);
            $this->updateProduct($game_data);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
    }

    private function getGameData($data)
    {
        $product_values = [];

        foreach ($data as $name => $value) {
            if ($name != 'product_id' && $name != 'image') {
                $product_values[$name] = $value;
            }
        }

        $product_values['product_thumbnail'] = NULL;
        $product_values['snapshots'] = NULL;

        if (!empty($data['image'] ?? NULL)) {
            $files = $this->upload_product_images($data['image']);
            $product_values['product_thumbnail'] = $files[0];
            $product_values['snapshots'] = serialize($files[1]);
        }

        // CHECKS IF THERE IS A PRODUCT ID IN THE ARRAY 
        // IF THERE IS IT MEANS THAT AN UPDATE IS HAPPENING AND NOT A INSERT
        if (isset($data['product_id'])) {
            $product_values['product_id'] = $data['product_id'];
        }

        // return [$product_id, prod]
        return $product_values;
    }

    public function archiveGame($product_id)
    {
        $this->archiveProduct($product_id);
    }

    private function upload_product_images($files)
    {

        if (empty($files ?? NULL)) {
            return;
        }

        $product_image = [];
        $product_image_tmp = [];
        foreach ($files as $name => $value) {

            if ($name == 'name' || $name == 'tmp_name') {
                foreach ($value as $file_info) {
                    ($name == 'name') ? $product_image[] = $file_info : $product_image_tmp[] = $file_info;
                }
            }
        }

        $thumbnail = '';
        $snapshots = [];

        for ($i = 0; $i < count($product_image); $i++) {

            $file_name = $product_image[$i];
            $file_extension = end(explode(".", $file_name));

            $file_name = ($i == 0) ? 'product_thumbnail_' : 'product_snapshot_';
            $file_name .= rand(0, 999999) . "." . $file_extension;

            ($i == 0) ? $thumbnail = $file_name : $snapshots[] = $file_name;

            $source_path = $product_image_tmp[$i];

            $upload_directory = "../assets/" . (($i == 0) ? 'thumbnails/' : 'snapshots/');

            $destination_path = $upload_directory . $file_name;

            $this->upload_images($source_path, $destination_path);
        }

        return [$thumbnail, $snapshots];
    }

    private function upload_category_asset($files)
    {

        if (empty($files ?? NULL)) {
            return;
        }

        $file_name = $files['bg_image']['name'];
        $ext = end(explode('.', $file_name));

        $file_name = 'category_image_' . rand(0, 9999) . '.' . $ext;

        $destination_directory = '../assets/category_assets/';
        $destination_path = $destination_directory . $file_name;

        $source_path = $files['bg_image']['tmp_name'];

        $this->upload_images($source_path, $destination_path);

        return $file_name;
    }

    private function upload_images($source_path, $destination_path)
    {
        try {
            move_uploaded_file($source_path, $destination_path);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
    }

    public function clear_unused_resources()
    {
        $this->clear_resources();
    }

    public function updateOrderStatus($order_id, $order_status)
    {
        $this->setOrder($order_id, $order_status);
    }

    public function addPlatform($platform_name)
    {
        $this->setPlatform($platform_name);
    }

    public function updatePlatform($platform_name, $id)
    {
        $this->setPlatformName($platform_name, $id);
    }

    public function deletePlatform($platform_id)
    {
        $this->removePlatform($platform_id);
    }

    public function addCategory($category_name, $description, $image)
    {
        $file_name = $this->upload_category_asset($image);

        try {
            $this->setCategory($category_name, $file_name, $description);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
    }

    public function reformCategory($category_name, $bg_image = NULL, $description, $id)
    {

        if ($bg_image != NULL) {
            $file_name = $this->upload_category_asset($bg_image);
            echo "THIS IS HAPPENING";
            try {
                $this->updateCategory($category_name, $file_name, $description, $id);
            } catch (Exception $e) {
                echo "ERROR: $e";
            }
        } else {
            $this->updateCategory($category_name, NULL, $description, $id);
        }
    }

    public function deleteCategory($category_id)
    {
        $this->removeCategory($category_id);
    }
}
