<div class="modal" id="confirmationModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <!-- <h5 class="modal-title"></h5> -->
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="text-center fs-5">Are you sure you want to remove: <u id="confirmMessage"></u></p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button class="btn btn-warning" id="confirm_delete" onclick="removeFromCart(this)" data-bs-toggle="modal" data-bs-target="#confirmModal">Confirm</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="confirmModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <!-- <h5 class="modal-title"></h5> -->
                <a href="" id="modal_close" class="">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </a>
            </div>
            <div class="modal-body">
                <p id="modalStatus" class="text-success text-center fs-3"></p>
            </div>
        </div>
    </div>
</div>