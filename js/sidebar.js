const HAMBURGER = document.getElementById('toggle-button');

HAMBURGER.addEventListener('click', function() {
	document.getElementById('sidebar').classList.toggle('expand');
})