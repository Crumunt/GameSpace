<?php

class Authentication extends Dbh
{

    protected function setUser($full_name, $username, $email, $password)
    {

        $sql = "INSERT INTO tbl_users(full_name, email) VALUES (?,?)";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$full_name, $email])) {
            header("location: ../signup.php");
            exit();
        }

        $user_id = $this->getUserId($email);

        $login_table_sql = "INSERT INTO tbl_login(username, password, user_id) VALUES (?,?,?)";
        $login_stmt = $this->connect()->prepare($login_table_sql);

        if (!$login_stmt->execute([$username, $password, $user_id])) {
            header("location: ../signup.php");
            exit();
        }

        return [$username, $user_id, $email];
    }

    private function getUserId($email)
    {
        $sql = "SELECT id FROM tbl_users WHERE email = ?";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$email])) {
            header("location: ../signup.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $results[0]['id'];
    }

    protected function fetchUser($email, $password)
    {

        try {
            $sql = "SELECT * FROM user_view WHERE email LIKE ?";
            $stmt = $this->connect()->prepare($sql);

            if (!$stmt->execute([$email])) {
                header("location: ../login.php?error=SomethingWentWrong");
                exit();
            }
        } catch (Exception $e) {
            echo "ERROR: $e";
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!password_verify($password, $results[0]['password'])) {
            // header("location: ../login.php?error=WrongPassword");
            echo "error";
            exit();
        }

        return $results;
    }

    protected function getUserEmail($email)
    {
        $sql = "SELECT * FROM tbl_users WHERE email = ?";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$email])) {
            header("location: ../signup.php?error=SomethingWentWrong");
            exit();
        }

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }
}
