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
            header("location: ../index.php?error=SomethignWentWrong");
            exit();
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

            ($i == 0) ? $thumbnail = $file_name: $snapshots[] = $file_name;

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

    public function clear_unused_resources() {
        $this->clear_resources();
    }
}
