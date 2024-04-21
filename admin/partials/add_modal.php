<?php
$page = basename($_SERVER['PHP_SELF'], '.php');
$page_header = ($page == 'manage-categories') ? 'Category' : 'Platform'
?>

<div class="modal fade" id="add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Manage <?= $page_header ?></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" id="add_form">
                    <label for="" class="form-label w-100">
                        <?= $page_header ?> Name
                        <input type="text" name="" id="input_field" onkeyup="checkDuplication(this)" aria-label="<?= strtolower($page_header) ?>" class="form-control w-100">
                        <div class="invalid-feedback">
                            <?= $page_header ?> has already been added
                        </div>
                    </label>
                    <?php if ($page == 'manage-categories') { ?>
                        <div class="form-group mt-3 d-flex gap-2 align-items-center flex-wrap justify-content-center">
                            <label for="category_image" class="form-label">
                                Background Image
                                <input type="file" name="" id="category_image" class="">
                            </label>
                        </div>
                        <div class="form-group mt-3">
                            <textarea name="" id="category_description" cols="30" rows="10" class="form-control"></textarea>
                        </div>
                    <?php } ?>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="save_button" data-bs-toggle="modal" data-bs-target="#confirm_modal" onclick="addContent()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="verify_modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="text-uppercase fs-5 text-center">Are you sure you want to delete: <b id="verify_message"></b>?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button id="confirm_remove_button" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirm_modal" onclick="removeContent(this.value)">Confirm</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="confirm_modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="confirm_message" class="text-uppercase text-success fs-4 text-center"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Okay</button>
            </div>
        </div>
    </div>
</div>