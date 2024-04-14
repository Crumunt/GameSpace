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
            card.parentNode.style.display = 'block';
        } else {
            card.parentNode.style.display = 'none';
        }
    });
}

function createPaginationButtons() {
    const totalPages = Math.ceil(cards.length / cardsPerPage);
    pagination.innerHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        let button = document.createElement('button');
        button.classList.add('btn')
        button.classList.add('btn-outline-light')
        button.innerText = i;
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