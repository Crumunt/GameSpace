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

function addThumbnail(file) {

    const thumbnail_wrapper = document.getElementById('thumbnail_container')
    let thumbnail_img = document.getElementById('thumbnail_img');

    if (thumbnail_img) {
        thumbnail_img.src = URL.createObjectURL(file.files[0])
    } else {
        const img = document.createElement('img')
        img.setAttribute('onclick', 'removeImage(this)');
        img.setAttribute('id', 'thumbnail_img')
        img.classList.add('img-fluid')
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
        snapshot.setAttribute('onclick', 'removeImage(this)');
        snapshot.classList.add('snapshot')
        snapshot.setAttribute('title', 'CLICK TO REMOVE')
        snapshot.src = URL.createObjectURL(file.files[i])
        snapshot_container.appendChild(snapshot)
    }

}

function removeImage(image) {
    image.remove();
}

function getFormData(id) {
    return document.getElementById(id)
}

function loadContent(tbl) {

    let data = new FormData()

    data.append('load_' + tbl, 'load')

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.getElementById('content_wrapper').innerHTML = this.responseText
            page_setter()
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php')
    xhr.send(data)

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
            loadContent('products')
            resetForm()
            console.log(this.responseText);
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

            let next_button = document.getElementById('next_button')
            next_button.removeAttribute('disabled')

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
            loadContent('products')
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
            getFormData('confirmation_message').textContent = this.responseText
            loadContent('products')
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php');
    xhr.send(data);
}

function getOrderInfo(button) {

    let order_id = button.getAttribute('data-order-id');

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            let data = JSON.parse(this.responseText)
            console.log(data)
            getFormData('updateOrderButton').setAttribute('data-order-id', data[0].id)
            getFormData('order_product').textContent = data[0].product_name
            getFormData('order_platform').textContent = data[0].platform_name
            getFormData('receipient_holder').textContent = data[0].receipient_name
            getFormData('order_address').textContent = data[0].order_address
            getFormData('order_quantity').textContent = data[0].quantity
            getFormData('order_total').textContent = "$" + data[0].order_total
            getFormData('order_status').value = data[0].order_status
        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?order_id=' + order_id);
    xhr.send();

}

function updateOrderInfo() {

    const order_id = getFormData('updateOrderButton').getAttribute('data-order-id')

    let data = new FormData()

    data.append('update_order', order_id)
    data.append('order_status', getFormData('order_status').value)

    console.log(data)

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            console.log(this.responseText)
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php')
    xhr.send(data)
}

function checkProductDuplication(input) {

    const product_name = input.value

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.responseText === 'duplication') {
                input.classList.add('is-invalid')
            } else {
                input.classList.remove('is-invalid')
            }
        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?product_name=' + product_name)
    xhr.send()

}

function validateProductInfo(form_control) {

    let next_button = document.getElementById('next_button')

    const text_fields = [...document.querySelectorAll('form .form-control')]
        .filter(input_field => input_field.value.trim() !== '')
        .length

    const category_field = [...document.querySelectorAll("input[type='checkbox'].category")]
        .filter(category => category.checked === true)
        .length

    const platform_field = [...document.querySelectorAll("input[type='checkbox'].platform")]
        .filter(platform => platform.checked === true)
        .length

    if (text_fields === 3 && category_field > 0 && platform_field > 0) {
        next_button.removeAttribute('disabled')
    } else {
        next_button.setAttribute('disabled', '')
    }

}

function changePage(button) {

    let page_number = Number(button.getAttribute('data-page-number'))
    let max_pages = document.getElementById('table_pagination').getAttribute('data-pages')
    let active_button = document.querySelector('.page-link.active')
    let page_button = document.querySelector(`button[data-page-number='${page_number}'].number_page`)

    let page = (document.getElementById('table_pagination').getAttribute('aria-label').includes('categories')) ? 'category' : 'platform'

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            active_button.classList.remove('active')
            document.getElementById('table_content_wrapper').innerHTML = this.responseText
            page_button.classList.add('active');
        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?' + page + '_page=' + button.getAttribute('data-page-number'))
    xhr.send()

}

function addContent() {

    let input_field = document.getElementById('input_field')
    let content_table = input_field.getAttribute('aria-label')

    let data = new FormData()
    data.append('addContent', 'content')
    data.append('input_name', input_field.value)
    data.append('content_table', content_table)
    if (content_table == 'category') {
        let bg_image = document.getElementById('category_image')
        let category_description = document.getElementById('category_description');
        data.append('bg_image', bg_image.files[0], bg_image.files[0].name)
        data.append('category_description', category_description.value)

        document.getElementById('add_form').reset()
    }

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.getElementById('confirm_message').textContent = `${content_table} added successfully`
            console.log(this.responseText)
            reloadPagination()
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php')
    xhr.send(data)

    console.log(data)

}

function loadTagInfo(id) {
    const input_field = getFormData('input_field')
    const page = input_field.getAttribute('aria-label')
    const save_button = document.getElementById('save_button')

    if (page == 'category') {
        const category_desc = getFormData('category_description')
    }

    console.log(page)

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {

            if (page == 'category') {
                let data = JSON.parse(this.responseText)
                input_field.value = data[0].category_name
                category_description.value = data[0].description
            } else {
                input_field.value = this.responseText
            }

            save_button.removeAttribute('onclick')
            save_button.setAttribute('value', id);
            save_button.setAttribute('onclick', 'updateContent(this)')
            save_button.textContent = 'Update'

        }
    }

    xhr.open('GET', `/GameSpace/form_handlers/adminHandler.php?${page}_id=${id}`)
    xhr.send();

}

function updateContent(button) {

    let input_field = document.getElementById('input_field')
    let content_table = input_field.getAttribute('aria-label')
    let save_button = document.getElementById('save_button')
    let content_id = button.value
    let page = document.querySelector('.number_page.active').getAttribute('data-page-number')

    let data = new FormData()

    data.append('updateContent', 'update')
    data.append('content_table', content_table)
    data.append('input_field', input_field.value)
    data.append('content_id', content_id)
    data.append('page_number', page)

    if (content_table == 'category') {
        let category_description = document.getElementById('category_description').value
        let bg_image = document.getElementById('category_image')

        if (bg_image.files.length > 0) {
            data.append('bg_image', bg_image.files[0], bg_image.files[0].name)
        }
        data.append('category_description', category_description)
    }

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.getElementById('confirm_message').textContent = `${content_table} updated successfully`
            document.getElementById('table_content_wrapper').innerHTML = this.responseText
            // console.log(this.responseText)
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php')
    xhr.send(data)

    save_button.removeAttribute('onclick')
    save_button.setAttribute('onlick', 'addContent(this)')
    save_button.textContent = 'Update'
}

function confirmRemoveTag(id) {

    const content_table = document.getElementById('table_pagination').getAttribute('aria-label')
    let content_header = (content_table.includes('categories')) ? 'category' : 'platform'

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.getElementById('verify_message').textContent = this.responseText
            document.getElementById('confirm_remove_button').value = id
        }
    }

    xhr.open('GET', `/GameSpace/form_handlers/adminHandler.php?confirm_delete=${id}&content_table=${content_header}`)
    xhr.send();

}

function removeContent(id) {

    let content_table = document.getElementById('table_pagination').getAttribute('aria-label')
    let content_header = (content_table.includes('categories')) ? 'category' : 'clatform'
    let page = document.querySelector('.number_page.active').getAttribute('data-page-number')

    let data = new FormData()

    data.append('content_delete_id', id)
    data.append('content_table', content_header)
    data.append('page_number', page)


    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.getElementById('confirm_message').textContent = `${content_header} has been deleted successfully`
            document.getElementById('table_content_wrapper').innerHTML = this.responseText
            reloadPagination()
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php')
    xhr.send(data)
}


function checkDuplication(input) {

    let keyword = input.value
    let tbl = input.getAttribute('aria-label')

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            // console.log(this.responseText)
            if (this.responseText == 'duplicate') {
                input.classList.remove('is-valid')
                input.classList.add('is-invalid')
            } else {
                input.classList.remove('is-invalid')
                input.classList.add('is-valid')
            }
        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?content_keyword=' + keyword + '&content=' + tbl)
    xhr.send();

}

function searchContent(keyword) {

    const content_table = document.getElementById('table_content_wrapper');
    const content = document.getElementById('table_pagination').getAttribute('aria-label')
    let content_keyword = (content.includes('categories')) ? 'category_keyword' : 'platform_keyword'

    let xhr = new XMLHttpRequest()
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            content_table.innerHTML = this.responseText;
        }
    }

    xhr.open('GET', `/GameSpace/form_handlers/adminHandler.php?${content_keyword}=${keyword}`)
    xhr.send()
}

function reloadPagination() {

    let pagination_wrapper = document.getElementById('table_pagination')
    let content_header = (pagination_wrapper.getAttribute('aria-label').includes('categories')) ? 'category_' : 'platform_'


    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            pagination_wrapper.innerHTML = this.responseText
        }
    }

    xhr.open('GET', '/GameSpace/form_handlers/adminHandler.php?reload_pagination=' + content_header)
    xhr.send()

}