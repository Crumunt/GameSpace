function getDataFromId(id) {
    return document.getElementById(id)
}


function addToCart(button) {


    let data = new FormData();

    data.append('add_to_cart', 'add')
    data.append('product_id', button.value)
    data.append('quantity', getDataFromId('quantity').value)

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {

        if (this.readyState == 4) {
            if (this.responseText == "ERROR") {
                window.location = '../login.php';
            }
            document.getElementById('modalStatus').textContent = this.responseText
        }

    }

    xhr.open('POST', '/GameSpace/form_handlers/userHandler.php')
    xhr.send(data)

}

function removeFromCart(button) {

    let data = new FormData();

    data.append('removeCartItem', 'remove')
    data.append('product_id', button.value);

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {

        if (this.readyState == 4) {

            document.getElementById('cart_wrapper').innerHTML = this.responseText
            document.getElementById('modalStatus').textContent = "Item has been Removed."
            console.log('hehe');


        }

    }

    xhr.open('POST', '/GameSpace/form_handlers/userHandler.php')
    xhr.send(data)

}

function confirmDelete(button) {

    document.getElementById('confirmMessage').textContent = button.value

}

function checkout(user_id, product_id) {

    let data = new FormData()

    data.append('checkout', 'checkout')
    data.append('user_id', user_id)
    data.append('recipient_name', getDataFromId('fullname').value)
    data.append('recipient_email', getDataFromId('email').value);
    data.append('product_id', product_id);
    data.append('quantity', getDataFromId('order_quantity').textContent)
    data.append('order_total', getDataFromId('order_total').textContent)
    data.append('order_address', getDataFromId('address').value)

    console.log(data);

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.getElementById('modalStatus').textContent = 'Please check your email to confirm.'
            document.getElementById('modal_close').setAttribute('href', '../index.php');
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/userHandler.php');

    xhr.send(data);
}

function checkInput() {

    let checkout_button = document.getElementById('checkout_button')

    let checkout_data = document.querySelectorAll('input.checkout_data')

    let counter = 0;

    checkout_data.forEach(input => {
        if (input.value == '') {
            counter++;
            console.log('hehe')
        }
    })

    if (counter != 0) {
        checkout_button.setAttribute('disabled', '');
    } else {
        checkout_button.removeAttribute('disabled');
    }

    console.log(counter)

}

let games_wrapper = document.getElementById('games-container')
games_wrapper.onload = page_setter() 

function searchGames(keyword) {

    let data = new FormData()

    data.append('keyword', keyword)

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('games-container').innerHTML = this.responseText
            page_setter();
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/userHandler.php');

    xhr.send(data);

}

function page_setter() {
    const gamesContainer = document.getElementById('games-container');
    const pagination = document.getElementById('page_control');
    const cards = document.querySelectorAll('.card');
    const cardsPerPage = 20;
    let currentPage = 1;

    function showPage(page) {
        const startIndex = (page - 1) * cardsPerPage;
        const endIndex = startIndex + cardsPerPage;

        cards.forEach((card, index) => {
            if (index >= startIndex && index < endIndex) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
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

function redirectCheckout(product_id) {

    let id = product_id
    let quantity = getDataFromId('quantity').value

    window.location = `checkout.php?product_id=${id}&quantity=${quantity}`

}