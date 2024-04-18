let game_wrapper = document.getElementById('content_wrapper')
window.onload = page_setter()

function searchProduct(keyword) {

    let data = new FormData();
    data.append('product_keyword', keyword);

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('content_wrapper').innerHTML = this.responseText
            page_setter()
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php');
    xhr.send(data);

}

function page_setter() {
    const pagination = document.getElementById('page_control');
    const cards = document.querySelectorAll('.card');
    const cardsPerPage = 20;
    let currentPage = 1;

    function showPage(page) {
        const startIndex = (page - 1) * cardsPerPage;
        const endIndex = startIndex + cardsPerPage;

        cards.forEach((card, index) => {
            if (index >= startIndex && index < endIndex) {
                card.parentElement.style.display = 'block';
            } else {
                card.parentElement.style.display = 'none';
            }
        });
    }

    function createPaginationButtons() {
        const totalPages = Math.ceil(cards.length / cardsPerPage);
        pagination.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const button = document.createElement('button');
            button.innerText = i;
            button.classList.add('btn')
            button.classList.add('btn-outline-light')
            if (i === currentPage) {
                button.classList.add('active');
            }
            button.addEventListener('click', () => {
                currentPage = i;
                showPage(currentPage);
                updatePaginationButtons();
            });
            pagination.appendChild(button);
        }
    }

    function updatePaginationButtons() {
        const buttons = document.querySelectorAll('.pagination button');
        buttons.forEach((button, index) => {
            if (index + 1 === currentPage) {
                button.classList.add('active');
            } else {
                button.classList.remove('active');
            }
        });
    }

    showPage(currentPage);
    createPaginationButtons();
}

function changeOrderStatus(cart_id, status) {
    console.log(cart_id)
    console.log(status)
}

function addThumbnail(file) {

    const thumbnail_wrapper = document.getElementById('thumbnail_container')
    let thumbnail_img = document.getElementById('thumbnail_img');

    if (thumbnail_img) {
        thumbnail_img.src = URL.createObjectURL(file.files[0])
    } else {
        const img = document.createElement('img')
        img.setAttribute('id', 'thumbnail_img')
        img.src = URL.createObjectURL(file.files[0])
        thumbnail_wrapper.appendChild(img)

    }
}

function addSnapshots(file) {

    const snapshot_container = document.getElementById('snapshot_container')
    console.log(snapshot_container.childElementCount)

    if (snapshot_container.childElementCount == 6) return;

    for (let i = 0; i < file.files.length & i <= 6; i++) {
        let snapshot = document.createElement('img')
        snapshot.setAttribute('onclick', 'removeSnapshot(this)');
        snapshot.classList.add('snapshot')
        snapshot.src = URL.createObjectURL(file.files[i])
        snapshot_container.appendChild(snapshot)
    }

}

function removeSnapshot(snapshot) {
    snapshot.remove();
}

function getFormData(id) {
    return document.getElementById(id)
}

function addProduct() {

    let data = new FormData()

    data.append('add_game', 'add_game')
    data.append('product_name', getFormData('product_name').value)
    data.append('product_description', getFormData('product_description').value)
    let checkboxes = document.querySelectorAll("input[type='checkbox']")
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked == true) {
            (checkboxes[i].name == 'category[]') ? data.append('category[]', checkboxes[i].value) : data.append('platform[]', checkboxes[i].value)
        }
    }
    data.append('product_price', getFormData('product_price').value)

    let thumbnail = getFormData('thumbnail_input')
    data.append('game_images[]', thumbnail.files[0], thumbnail.files[0].name)

    let images = getFormData('snapshot_input')
    for (let j = 0; j < images.files.length; j++) {
        data.append('game_images[]', images.files[j], images.files[j].name)
    }

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            console.log(this.responseText)
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php');
    xhr.send(data)
}

function loadGameInfo(button) {

    let product_id = button.getAttribute('data-product-id');
    let categories = document.querySelectorAll("input[type='checkbox']")

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            let json_data = this.responseText
            let parsed_data = JSON.parse(json_data);

            let modal_header = document.getElementById('modal_status')
            let modal_sub_header = document.getElementById('modal_status_extend')

            modal_header.textContent = 'Update Game'
            modal_sub_header.textContent = 'Update Game'

            let save_button = document.getElementById('save_button')
            save_button.setAttribute('value', parsed_data[0].id)
            save_button.textContent = 'Update'

            getFormData('product_name').value = parsed_data[0].product_name
            getFormData('product_description').value = parsed_data[0].product_description.replace(/(<([^>]+)>)/ig, '')
            getFormData('product_price').value = parsed_data[0].price

            for (let i = 0; i < parsed_data.length; i++) {

                let category_name = parsed_data[i].category_name
                let platform_name = parsed_data[i].platform_name

                categories.forEach(checkbox => {

                    let parent_element = checkbox.parentElement.textContent
                    if (parent_element.includes(category_name) || parent_element.includes(platform_name)) {
                        checkbox.checked = true;

                    }
                })
            }

            document.getElementById('save_button').setAttribute('onclick', 'updateData(this)')

        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?product_id=' + product_id);

    xhr.send();

}

function updateData(button) {

    let data = new FormData()
    data.append('update_game', 'update');
    data.append('product_id', button.value);
    data.append('product_name', getFormData('product_name').value);
    data.append('product_description', getFormData('product_description').value)
    let checkboxes = document.querySelectorAll("input[type='checkbox']")
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked == true) {
            (checkboxes[i].name == 'category[]') ? data.append('category[]', checkboxes[i].value) : data.append('platform[]', checkboxes[i].value)
        }
    }
    data.append('product_price', getFormData('product_price').value)

    let thumbnail = getFormData('thumbnail_input')
    if (thumbnail.files.length > 0) {
        data.append('game_images[]', thumbnail.files[0], thumbnail.files[0].name)
    }

    let images = getFormData('snapshot_input')
    if (images.files.length > 0) {
        for (let j = 0; j < images.files.length; j++) {
            data.append('game_images[]', images.files[j], images.files[j].name)
        }
    }

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            console.log(this.responseText)
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php')
    xhr.send(data);

}

function resetForm() {

    getFormData('product_name').value = ''
    getFormData('product_description').value = ''
    getFormData('product_price').value = '1';
    let checkboxes = document.querySelectorAll("input[type='checkbox']")
    checkboxes.forEach(checkbox => {
        if (checkbox.checked == true) {
            checkbox.checked = false;
        }
    })

    let thumbnail = getFormData('thumbnail_input')
    let snapshots = getFormData('snapshot_input')

    thumbnail.value = ''
    snapshots.value = ''

    const thumbnail_wrapper = document.getElementById('thumbnail_container')
    const snapshot_container = document.getElementById('snapshot_container')

    if (thumbnail_wrapper.childElementCount === 1) {
        thumbnail_wrapper.firstElementChild.remove();
    }

    while (snapshot_container.firstChild) {
        snapshot_container.firstChild.remove()
    }

    let modal_header = document.getElementById('modal_status')
    let modal_sub_header = document.getElementById('modal_status_extend')

    modal_header.textContent = 'Add Game'
    modal_sub_header.textContent = 'Add Game'

    let save_button = document.getElementById('save_button')
    save_button.removeAttribute('value')
    save_button.textContent = 'Save'
    save_button.setAttribute('onclick', 'addProduct()')
}

function confirmDelete(button) {

    let attribute_value = button.getAttribute('data-id').split('_')
    let id = attribute_value[1]
    let tbl = attribute_value[0]

    let xhr = new XMLHttpRequest

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            const data = JSON.parse(this.responseText)
            getFormData('confirmation_text').textContent = data[0].product_name
            getFormData('confirm_button').setAttribute('data-id', `${tbl}_${id}`);
        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?archive_content=' + id + '&tbl=' + tbl);
    xhr.send();

}

function archiveData(button) {
    let attribute_value = button.getAttribute('data-id').split('_')
    let id = attribute_value[1]
    let tbl = attribute_value[0]

    let data = new FormData()

    data.append('archive_data', id)
    data.append('tbl', tbl)

    let xhr = new XMLHttpRequest

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            // getFormData('confirmation_message').textContent = this.responseText
            console.log(this.responseText)
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php');
    xhr.send(data);
}