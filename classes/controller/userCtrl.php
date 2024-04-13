<?php

class UserCtrl extends User
{


    public function addToCart($id, $quantity)
    {

        $action = $this->addItemToCart($id, $quantity);

        header("location: ../index.php?error=none");
        exit();
    }
}
