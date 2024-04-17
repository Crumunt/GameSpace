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

    for (let i = 0; i < file.files.length; i++) {
        let snapshot = document.createElement('img')
        snapshot.classList.add('snapshot')
        snapshot.src = URL.createObjectURL(file.files[i])
        snapshot_container.appendChild(snapshot)
    }

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