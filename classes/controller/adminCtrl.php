<?php

class AdminCtrl extends Admin
{

    public function addProduct($data)
    {
        $product_name = $data['product_name'];
        $product_desc = $data['product_description'];
        $product_category = $data['category'];
        $product_platform = $data['platform'];
        $price = $data['product_price'];

        $files = $this->upload_images($data['image']);

        $thumbnail = $files[0];
        $serialized_snapshots = serialize($files[1]);

        $this->setProduct($product_name, $product_desc, $thumbnail, $serialized_snapshots, $price, $product_category, $product_platform);
    }

    private function upload_images($files)
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

            $file_tmp = $product_image_tmp[$i];

            $upload_directory = "../assets/" . (($i == 0) ? 'thumbnails/' : 'snapshots/');

            $upload_destination = $upload_directory . $file_name;

            try {
                move_uploaded_file($file_tmp, $upload_destination);
            } catch (Exception $e) {
                echo "ERROR: $e";
                exit();
            }
        }

        return [$thumbnail, $snapshots];
    }

    private function upload_image($files) {

        if(empty($files ?? NULL)) {
            return;
        }

        $file_name = $files['bg_image']['name'];
        $ext = end(explode('.', $file_name));

        $file_name = 'category_image_' . rand(0,9999) . '.' . $ext;

        $destination_directory = '../assets/category_assets/';
        $destination_path = $destination_directory . $file_name;

        $source_path = $files['bg_image']['tmp_name'];

        try {
            $upload = move_uploaded_file($source_path, $destination_path);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }

        if(!$upload) {
            // header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        return $file_name;

    }

    public function clear_unused_resources()
    {
        $this->clear_resources();
    }

    public function updateGame($data)
    {
        $product_id = $data['product_id'];
        $product_name = $data['product_name'];
        $product_desc = $data['product_description'];
        $product_category = $data['category'];
        $product_platform = $data['platform'];
        $price = $data['product_price'];

        $thumbnail = NULL;
        $serialized_snapshots = NULL;

        if (!empty($data['image'] ?? NULL)) {
            $files = $this->upload_images($data['image']);
            $thumbnail = $files[0];
            $serialized_snapshots = serialize($files[1]);
        }


        try {
            $this->updateProduct($product_name, $product_desc, $thumbnail, $serialized_snapshots, $price, $product_category, $product_platform, $product_id);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
    }

    public function archiveGame($product_id) {
        $this->archiveProduct($product_id);
    }

    public function updateOrderStatus($order_id, $order_status) {
        $this->setOrder($order_id, $order_status);
    }

    public function addPlatform($platform_name) {
        $this->setPlatform($platform_name);
    }
    
    public function updatePlatform($platform_name, $id) {
        $this->setPlatformName($platform_name, $id);
    }

    public function deletePlatform($platform_id) {
        $this->removePlatform($platform_id);
    }

    public function addCategory($category_name, $description, $image) {
        $file_name = $this->upload_image($image);

        try {
            $this->setCategory($category_name, $file_name, $description);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
    }

    public function reformCategory($category_name, $bg_image = NULL, $description, $id) {

        if($bg_image != NULL) {
            $file_name = $this->upload_image($bg_image);
            echo "THIS IS HAPPENING";
            try {
                $this->updateCategory($category_name, $file_name, $description, $id);
            } catch (Exception $e) {
                echo "ERROR: $e";
            }
        }else {
            $this->updateCategory($category_name, NULL, $description, $id);
        }

    }

    public function deleteCategory($category_id) {
        $this->removeCategory($category_id);
    }
}
