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

            $upload_directory = "../assets/" . (($i == 0) ? 'thumbnails/' : '');

            $upload_destination = $upload_directory . $file_name;

            try {
                move_uploaded_file($file_tmp, $upload_destination);
            } catch (Exception $e) {
                echo "ERROR: $e";
            }
        }

        return [$thumbnail, $snapshots];
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
}
