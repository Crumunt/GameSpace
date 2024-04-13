<?php

require "../classes/dbh.php";


if($_SERVER['REQUEST_METHOD'] == "POST") {

    if(isset($_POST['add__to__cart'])) {
        addItemToCart($conn);
    }

}

function addItemToCart($conn) {
    
}