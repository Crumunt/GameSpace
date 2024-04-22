<?php

class Admin extends Dbh
{

    private function executeQuery($stmt, ...$query_values)
    {
        if (!$stmt->execute($query_values)) {
            header("../admin/index.php?error=SomethingWentWrong");
            exit();
        }
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function showGames()
    {

        $sql = "SELECT * FROM product_view GROUP BY id";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function getProductInfo($product_id)
    {

        $sql = "SELECT product_view.id, product_name, product_description, category_name, platform_name, price FROM product_view INNER JOIN game_platform_view ON product_view.id = game_platform_view.product_id WHERE product_view.id = ?";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt, $product_id);
    }

    protected function getProductCount()
    {
        $sql = "SELECT COUNT(*) as count FROM tbl_products WHERE deleted_at IS NULL";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function setCategory($category_name, $background_image, $description)
    {
        $sql = "INSERT INTO tbl_categories(category_name, background_image, description) VALUES (?,?,?)";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $category_name, $background_image, $description);
    }

    protected function getCategories($offset = 0, $limit = NULL, $where = NULL)
    {
        $sql = "SELECT * FROM tbl_categories";

        if ($where != NULL) {
            $sql .= " WHERE $where";
        }

        if ($limit != NULL) {
            $sql .= " LIMIT $offset, $limit";
        }

        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function getCategory($id)
    {
        $sql = "SELECT * FROM tbl_categories WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$id])) {
            header("location: ../index.php?error=SomethingWentWrong");
        }

        return $this->executeQuery($stmt, $id);
    }

    protected function getPopularCategories()
    {
        $sql = "SELECT * FROM popular_categories LIMIT 7";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function removeCategory($category_id)
    {
        $sql = "DELETE FROM tbl_categories WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $category_id);
    }

    protected function setPlatform($platform_name)
    {
        $sql = "INSERT INTO tbl_platforms(platform_name) VALUES (?)";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $platform_name);
    }

    protected function getPlatforms($offset, $limit, $where)
    {
        $sql = "SELECT * FROM tbl_platforms";

        if ($where != NULL) {
            $sql .= " WHERE $where";
        }

        if ($limit != NULL) {
            $sql .= " LIMIT $offset, $limit";
        }

        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function getPlatform($platform_id)
    {
        $sql = "SELECT * FROM tbl_platforms WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt, $platform_id);
    }

    protected function removePlatform($platform_id)
    {
        $sql = "DELETE FROM tbl_platforms WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $platform_id);
    }

    protected function setPlatformName($platform_name, $platform_id)
    {
        $sql = "UPDATE tbl_platforms SET platform_name = ? WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $platform_name, $platform_id);
    }

    protected function searchGames($keyword)
    {

        $sql = "SELECT * FROM product_view WHERE product_name LIKE ? GROUP BY id";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt, $keyword);
    }

    protected function getOrders($limit = NULL)
    {
        $sql = "SELECT * FROM order_view WHERE order_completed IS NULL ORDER BY id DESC";

        if ($limit != NULL) {
            $sql .= " LIMIT $limit";
        }

        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function getOrderInfo($order_id)
    {
        $sql = "SELECT * FROM order_view WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt, $order_id);
    }

    protected function setOrder($order_id, $order_status)
    {
        $sql = "UPDATE tbl_orders SET order_status = ? WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $order_status, $order_id);
    }

    protected function getOrderCount()
    {
        $sql = "SELECT COUNT(*) as count FROM order_view WHERE order_completed IS NULL";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function getCompletedOrderCount()
    {
        $sql = "SELECT COUNT(*) as count FROM order_view WHERE NOT order_completed IS NULL";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function getUserCount()
    {
        $sql = "SELECT COUNT(*) as count FROM tbl_users WHERE role = 'student'";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function setProduct($data)
    {
        // SQL
        // CREATE SQL STATEMENT "?" ACTS AS PLACEHOLDERS FOR THE ACTUAL VALUE THAT WILL BE STORED IN THE DATABASE
        // USING "?" REDUCES THE RISK OF SQL INJECTION
        $prod_sql = "INSERT INTO tbl_products (product_name, product_description, price, product_thumbnail, snapshots) VALUES (?,?,?,?,?)";
        $prod_stmt = $this->connect()->prepare($prod_sql);

        $product_values = [];
        foreach ($data as $name => $value) {
            if ($name != 'category' && $name != 'platform') {
                array_push($product_values, $value);
            }
        }

        $this->executeQuery($prod_stmt, ...$product_values);

        $last_prod_id_sql = "SELECT id FROM `tbl_products` ORDER BY id DESC LIMIT 1";
        $last_prod_id_stmt = $this->connect()->prepare($last_prod_id_sql);
        $last_prod_id_stmt->execute();
        $results = $last_prod_id_stmt->fetchAll(PDO::FETCH_ASSOC);
        $last_prod_id = $results[0]['id'];

        foreach ($data['category'] as $category) {
            $this->insertCategories($last_prod_id, $category);
        }

        // LOOP THROUGH ALL PLATFORMS SELECTED AND STORE IT IN THE DATABASE
        foreach ($data['platform'] as $platform) {
            $this->insertPlatforms($last_prod_id, $platform);
        }
    }

    private function insertPlatforms($product_id, $platform_id)
    {
        $sql = "INSERT INTO tbl_product_platforms(product_id, platform_id) VALUES (?,?)";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $product_id, $platform_id);
    }

    private function insertCategories($product_id, $category_id)
    {
        $sql = "INSERT INTO tbl_product_categories(product_id, category_id) VALUES (?,?)";
        $stmt = $this->connect()->prepare($sql);

        // EXECUTE ACCEPTS AN ARRAY AS A ARGUMENT, THIS ARRAY STORES THE VALUES THAT WILL USED BY THE PLACEHOLDERS
        // ORDER IS IMPORTANT
        $this->executeQuery($stmt, $product_id, $category_id);
    }

    protected function updateProduct($data)
    {
        // create initial sql without the thumbnail and snapshots
        $prod_sql = "UPDATE tbl_products SET product_name = ?, product_description = ?, price = ?";

        $product_values = [];

        // DATA THAT WOULD NOT BE INCLUDED IN THE INITIAL UPDATE
        $flag_names = ['product_thumbnail', 'snapshots', 'product_id', 'category', 'platform'];
        foreach ($data as $name => $value) {
            if (!in_array($name, $flag_names)) {
                $product_values[] = $value;
            }
        }

        // check if thumbnail is not null
        // if not null concat a update statement in the sql and push its corresponding value to the products_array
        if ($data['product_thumbnail'] != NULL) {
            $prod_sql .= ", product_thumbnail = ?";
            $product_values[] = $data['product_thumbnail'];
        }

        // same procedure as the one from the thumbnail
        if ($data['snapshots'] != NULL) {
            $prod_sql .= ", snapshots = ?";
            $product_values[] = $data['snapshots'];
        }

        // lastly concat where condition and push the product_id into the products_array
        $prod_sql .= " WHERE id = ?";
        $product_values[] = $data['product_id'];

        $prod_stmt = $this->connect()->prepare($prod_sql);

        $this->executeQuery($prod_stmt, ...$product_values);

        foreach ($data['category'] as $category) {

            $del_cat_sql = "DELETE FROM tbl_product_categories WHERE product_id = ?";
            $del_cat_stmt = $this->connect()->prepare($del_cat_sql);

            if (!$del_cat_stmt->execute([$data['product_id']])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }

            $this->insertCategories($data['product_id'], $category);
        }

        // LOOP THROUGH ALL PLATFORMS SELECTED AND STORE IT IN THE DATABASE
        foreach ($data['platform'] as $platform) {

            $del_plat_sql = "DELETE FROM tbl_product_platforms WHERE product_id = ?";
            $del_plat_stmt = $this->connect()->prepare($del_plat_sql);

            if (!$del_plat_stmt->execute([$data['product_id']])) {
                header("location: ../admin/index.php?error=SomethingWentWrong");
                exit();
            }

            try {
                $this->insertPlatforms($data['product_id'], $platform);
            } catch (Exception $e) {
                echo "ERROR: $e";
                exit();
            }
        }
    }

    protected function archiveProduct($product_id)
    {
        $sql = "UPDATE tbl_products SET deleted_at = NOW() WHERE id = ?";
        $stmt = $this->connect()->prepare($sql);

        $this->executeQuery($stmt, $product_id);
    }

    protected function clear_resources()
    {

        $sql = "SELECT * FROM tbl_products";
        $stmt = $this->connect()->prepare($sql);

        $results = $this->executeQuery($stmt);
        $thumbnails_in_use = [];
        $snapshots_in_use = [];
        foreach ($results as $image) {
            $thumbnails_in_use[] = $image['product_thumbnail'];
            foreach (unserialize($image['snapshots']) as $snapshot) {
                $snapshots_in_use[] = $snapshot;
            }
        }

        $thumbnail_files = glob("../assets/thumbnails/*");
        $snapshot_files = glob("../assets/snapshots/*");

        foreach ($thumbnail_files as $thumb_file) {
            $thumb_name = end(explode('/', $thumb_file));
            if (!in_array($thumb_name, $thumbnails_in_use)) {
                unlink($thumb_file);
            }
        }

        // WAS WORKING LAST TIME CAN'T SEEM TO MAKE IT WORK NOW
        // WILL LOOK INTO

        // foreach ($snapshot_files as $snap_file) {
        //     // if(str_contains($snap_file, 'thumbnails') || str_contains($snap_file, 'svg')) continue;
        //     $snap_name = end(explode('/',$snap_file));
        //     if (!in_array($snap_name, $snapshot_files)) {
        //         unlink($snap_file);
        //     }
        // }

    }

    protected function getMonthlyUserRegistrations()
    {
        $sql = "SELECT MONTHNAME(date_registered) as monthname, COUNT(*) as users FROM tbl_users GROUP BY date_registered";
        $stmt = $this->connect()->prepare($sql);

        return $this->executeQuery($stmt);
    }

    protected function updateCategory($category_name, $bg_image = NULL, $description, $id)
    {

        $sql_values = [$category_name, $description];

        $sql = "UPDATE tbl_categories SET category_name = ?, description = ?";

        if ($bg_image != NULL) {
            $sql .= ", background_image = ?";
            array_push($sql_values, $bg_image);
        }

        $sql .= " WHERE id = ?";
        array_push($sql_values, $id);

        try {
            $stmt = $this->connect()->prepare($sql);

            $this->executeQuery($stmt, ...$sql_values);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }
    }
}
