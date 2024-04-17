<?php

class Admin extends Dbh
{
    protected function showGames()
    {

        $sql = "SELECT * FROM product_view GROUP BY id";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute()) {
            header("../admin/index.php?error=SomethingWentWrong");
            exit();
        }
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }
    
    protected function getProductCount() {
        $sql = "SELECT COUNT(*) as count FROM product_view WHERE deleted_at IS NULL";
        $stmt = $this->connect()->prepare($sql);

        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getCategories()
    {
        $sql = "SELECT * FROM tbl_categories";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }
    

    protected function getPlatforms()
    {
        $sql = "SELECT * FROM tbl_platforms";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function searchGames($keyword)
    {

        $sql = "SELECT * FROM product_view WHERE product_name LIKE ? GROUP BY id";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$keyword])) {
            header("../admin/index.php?error=SomethingWentWrong");
            exit();
        }
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getOrders()
    {
        $sql = "SELECT * FROM order_view";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getOrderCount() {
        $sql = "SELECT COUNT(*) as count FROM tbl_orders WHERE NOT order_status = 'delivered'";
        $stmt = $this->connect()->prepare($sql);

        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getCompletedOrderCount() {
        $sql = "SELECT COUNT(*) as count FROM tbl_orders WHERE order_status = 'delivered'";
        $stmt = $this->connect()->prepare($sql);

        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getUserCount() {
        $sql = "SELECT COUNT(*) as count FROM tbl_users WHERE role = 'student'";
        $stmt = $this->connect()->prepare($sql);

        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function setProduct($product_name, $product_desc, $product_thumbnail, $snapshots, $price, $product_category, $product_platform)
    {
        // SQL
        // CREATE SQL STATEMENT "?" ACTS AS PLACEHOLDERS FOR THE ACTUAL VALUE THAT WILL BE STORED IN THE DATABASE
        // USING "?" REDUCES THE RISK OF SQL INJECTION
        $prod_sql = "INSERT INTO tbl_products (product_name, product_description, product_thumbnail, snapshots, price) VALUES (?,?,?,?,?)";
        $prod_stmt = $this->connect()->prepare($prod_sql);

        if (!$prod_stmt->execute([$product_name, $product_desc, $product_thumbnail, $snapshots, $price])) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $last_prod_id_sql = "SELECT id FROM `tbl_products` ORDER BY id DESC LIMIT 1";
        $last_prod_id_stmt = $this->connect()->prepare($last_prod_id_sql);
        $last_prod_id_stmt->execute();
        $results = $last_prod_id_stmt->fetchAll(PDO::FETCH_ASSOC);
        $last_prod_id = $results[0]['id'];

        foreach ($product_category as $category) {
            $prod_cat_sql = "INSERT INTO tbl_product_categories(product_id, category_id) VALUES (?,?)";
            $prod_cat_stmt = $this->connect()->prepare($prod_cat_sql);

            // EXECUTE ACCEPTS AN ARRAY AS A ARGUMENT, THIS ARRAY STORES THE VALUES THAT WILL USED BY THE PLACEHOLDERS
            // ORDER IS IMPORTANT
            if (!$prod_cat_stmt->execute([$last_prod_id, $category])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }
        }

        // LOOP THROUGH ALL PLATFORMS SELECTED AND STORE IT IN THE DATABASE
        foreach ($product_platform as $platform) {
            $prod_plat_sql = "INSERT INTO tbl_product_platforms(product_id, platform_id) VALUES (?,?)";
            $prod_plat_stmt = $this->connect()->prepare($prod_plat_sql);

            if (!$prod_plat_stmt->execute([$last_prod_id, $platform])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }
        }
    }

    protected function clear_resources()
    {

        $sql = "SELECT product_thumbnail, snapshots FROM tbl_products";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $thumbnails_in_use = [];
        $snapshots_in_use = [];
        foreach ($results as $image) {
            array_push($thumbnails_in_use, $image['product_thumbnail']);
            foreach (unserialize($image['snapshots']) as $snapshot) {
                array_push($snapshots_in_use, $snapshot);
            }
        }

        // var_dump($snapshots_in_use);

        $thumbnail_files = glob("../assets/thumbnails/*");
        $snapshot_files = glob("../assets/");

        foreach ($thumbnail_files as $thumb_file) {
            $thumb_name = end(explode("/", $thumb_file));
            if (!in_array($thumb_name, $thumbnails_in_use)) {
                unlink($thumb_file);
            }
        }

        foreach ($snapshot_files as $snap_file) {
            $snap_name = end(explode("/", $snap_file));
            if (!in_array($snap_name, $snapshot_files)) {
                unlink($snap_file);
            }
        }
    }
}
