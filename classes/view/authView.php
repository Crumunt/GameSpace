<?php

class Authview extends Authentication
{

    public function fetchUserEmail($email)
    {
        $data = $this->getUserEmail($email);
        return $data;
    }
}
