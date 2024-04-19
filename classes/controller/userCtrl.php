<?php

class UserCtrl extends User
{


    public function addToCart($product_id, $quantity, $user_id)
    {
        $action = $this->addItemToCart($product_id, $quantity, $user_id);
        return $action;
    }

    public function removeFromCart($product_id, $user_id)
    {
        $this->removeItemFromCart($product_id, $user_id);
    }

    public function buyItem($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address)
    {

        try {

            $action = $this->purchaseGame($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }

        return $action;
    }

    public function setOrderReceived($order_id) {
        $this->setOrderComplete($order_id);
    }
}
