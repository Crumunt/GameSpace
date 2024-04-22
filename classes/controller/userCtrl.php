<?php

class UserCtrl extends User
{


    public function addToCart($product_id, $quantity, $user_id, $platform_id)
    {
        $action = $this->addItemToCart($product_id, $quantity, $user_id, $platform_id);
        return $action;
    }

    public function removeFromCart($product_id, $user_id)
    {
        $this->removeItemFromCart($product_id, $user_id);
    }

    public function buyItem($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address, $platform_id)
    {

        try {
            echo "THIS IS BEING CALLED";
            $action = $this->purchaseGame($user_id, $recipient_name, $product_id, $quantity, $order_total, $order_address, $platform_id);
        } catch (Exception $e) {
            echo "ERROR: $e";
        }

        return $action;
    }

    public function setOrderReceived($order_id)
    {
        $this->setOrderComplete($order_id);
    }

    public function updateCartItemQuantity($cart_id, $quantity, $user_id)
    {
        $this->setCartItemQuantity($cart_id, $quantity, $user_id);
    }

    public function submitConcern($concern_header, $concern_body, $user_id)
    {
        $this->sendConcern($concern_header, $concern_body, $user_id);
    }
}
