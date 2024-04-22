<?php 
include "partials/sidebar.php";

?>

<div class="container">
    <h1 class="text-white text-uppercase my-4">Contact Us</h1>
    <form id="concern_form" class="row" onsubmit="event.preventDefault()">
        <label for="" class="form-label text-white mt-3">
            Concern
            <input type="text" name="" id="concern_header" placeholder="Concern Header" class="form-control">
        </label>
        <label for="" class="form-label text-white mt-3">
            Additional Information
            <textarea name="" class="form-control" id="concern_body" cols="30" rows="10" placeholder="Describe the problem"></textarea>
        </label>
        <button name="send_concern" class="btn btn-success w-25 mx-auto mt-3" onclick="sendConcern()" data-bs-toggle="modal" data-bs-target="#confirmModal">Send</button>
    </form>
</div>

<?= include "partials/modal.php"; ?>