<?php

class SignupCtrl extends Signup {


    public function addUser($full_name, $username, $email, $password) {

        $userinfo = $this->setUser($full_name, $username, $email, $password);

        return $userinfo;

    }

}