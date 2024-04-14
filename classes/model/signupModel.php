<?php

class Signup extends Dbh
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

        return [$username, $user_id];
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
}
