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

    protected function getProductInfo($product_id) {

        $sql = "SELECT product_view.id, product_name, product_description, category_name, platform_name, price FROM product_view INNER JOIN game_platform_view ON product_view.id = game_platform_view.product_id WHERE product_view.id = ?";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute([$product_id])) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getProductCount()
    {
        $sql = "SELECT COUNT(*) as count FROM tbl_products WHERE deleted_at IS NULL";
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

    protected function getPopularCategories() {
        $sql = "SELECT * FROM popular_categories LIMIT 7";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethinWentWrong");
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

    protected function getOrders($limit = NULL)
    {
        $sql = "SELECT * FROM order_view WHERE order_completed IS NULL ORDER BY id DESC";

        if ($limit != NULL) {
            $sql .= " LIMIT $limit";
        }

        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }
    
    protected function getOrderInfo($order_id) {
        $sql = "SELECT * FROM order_view WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute([$order_id])) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function setOrder($order_id, $order_status) {
        $sql = "UPDATE tbl_orders SET order_status = ? WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute([$order_status, $order_id])) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

    }

    protected function getOrderCount()
    {
        $sql = "SELECT COUNT(*) as count FROM order_view WHERE order_completed IS NULL";
        $stmt = $this->connect()->prepare($sql);

        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getCompletedOrderCount()
    {
        $sql = "SELECT COUNT(*) as count FROM order_view WHERE NOT order_completed IS NULL";
        $stmt = $this->connect()->prepare($sql);

        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getUserCount()
    {
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

    protected function updateProduct($product_name, $product_desc, $product_thumbnail = NULL, $snapshots = NULL, $price, $product_category, $product_platform, $product_id) {
        // INITIALIZE empty array to store values that will be updated
        $products_array = [];
        // store value from parameters to products_array
        array_push($products_array, $product_name, $product_desc, $price);

        // create initial sql without the thumbnail and snapshots
        $prod_sql = "UPDATE tbl_products SET product_name = ?, product_description = ?, price = ?";

        // check if thumbnail is not null
        // if not null concat a update statement in the sql and push its corresponding value to the products_array
        if($product_thumbnail != NULL) {
            $prod_sql .= ", product_thumbnail = ?";
            array_push($products_array, $product_thumbnail);
        }
        // same procedure as the one from the thumbnail
        if($snapshots != NULL) {
            $prod_sql .= ", snapshots = ?";
            array_push($products_array, $snapshots);
        }
        // lastly concat where condition and push the product_id into the products_array
        $prod_sql .= " WHERE id = ?";
        array_push($products_array, $product_id);

        $prod_stmt = $this->connect()->prepare($prod_sql);

        if (!$prod_stmt->execute($products_array)) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        foreach ($product_category as $category) {

            $del_cat_sql = "DELETE FROM tbl_product_categories WHERE product_id = ? AND category_id = ?";
            $del_cat_stmt = $this->connect()->prepare($del_cat_sql);

            if (!$del_cat_stmt->execute([$product_id, $category])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }

            $prod_cat_sql = "INSERT INTO tbl_product_categories (product_id,category_id) VALUES (?,?)";
            $prod_cat_stmt = $this->connect()->prepare($prod_cat_sql);

            // EXECUTE ACCEPTS AN ARRAY AS A ARGUMENT, THIS ARRAY STORES THE VALUES THAT WILL USED BY THE PLACEHOLDERS
            // ORDER IS IMPORTANT
            if (!$prod_cat_stmt->execute([$product_id, $category])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }
        }

        // LOOP THROUGH ALL PLATFORMS SELECTED AND STORE IT IN THE DATABASE
        foreach ($product_platform as $platform) {
            
            $del_plat_sql = "DELETE FROM tbl_product_platforms WHERE product_id = ? AND platform_id = ?";
            $del_plat_stmt = $this->connect()->prepare($del_plat_sql);

            if(!$del_plat_stmt->execute([$product_id, $platform])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }

            $prod_plat_sql = "INSERT INTO tbl_product_platforms(product_id, platform_id) VALUES (?,?) ";
            $prod_plat_stmt = $this->connect()->prepare($prod_plat_sql);

            if (!$prod_plat_stmt->execute([$product_id, $platform])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }
        }
    }

    protected function archiveProduct($product_id) {
        $sql = "UPDATE tbl_products SET deleted_at = NOW() WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute([$product_id])) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }
    }
    
    protected function getMonthlyUserRegistrations() {
        $sql = "SELECT MONTHNAME(date_registered) as monthname, COUNT(*) as users FROM tbl_users GROUP BY date_registered";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute()) {
            header("location: ../index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }
}