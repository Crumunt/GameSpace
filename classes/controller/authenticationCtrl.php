<?php

class AuthenticationCtrl extends Authentication
{

    public function addUser($full_name, $username, $email, $password)
    {

        $userinfo = $this->setUser($full_name, $username, $email, $password);

        return $userinfo;
    }

    public function getUser($email, $password) {

        $userinfo = $this->fetchUser($email, $password);

        return $userinfo;

    }

}
