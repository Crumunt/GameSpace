<?php

class Admin extends Dbh
{

    protected function showGames()
    {

        $sql = "SELECT * FROM tbl_products";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute()) {
            header("../admin/index.php?error=SomethingWentWrong");
            exit();
        }
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getCategories() {
        $sql = "SELECT * FROM tbl_categories";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getPlatforms() {
        $sql = "SELECT * FROM tbl_platforms";
        $stmt = $this->connect()->prepare($sql);

        if(!$stmt->execute()) {
            header("location: ../admin/index.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function searchGames($keyword)
    {

        $sql = "SELECT * FROM tbl_products WHERE product_name LIKE ?";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$keyword])) {
            header("../admin/index.php?error=SomethingWentWrong");
            exit();
        }
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }
}
