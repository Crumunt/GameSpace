function sendWarning() {

    const email = document.getElementById('email')
    const password = document.getElementById('password')

    let data = new FormData()

    data.append('login', 'login')
    data.append('email', email.value)
    data.append('password', password.value)

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function() {
        if(this.readyState == 4) {
            if(this.responseText.includes('error')) {
                email.classList.add('is-invalid')
                password.classList.add('is-invalid')
            }else {
                window.location.href = this.responseText
            }
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/login_signup_handler.php')
    xhr.send(data)

}