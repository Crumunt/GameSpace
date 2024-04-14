function searchProduct(keyword) {

    let data = new FormData();
    data.append('product_keyword', keyword);

    let xhr = new XMLHttpRequest()

    xhr.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            document.getElementById('content_wrapper').innerHTML = this.responseText
        }
    }

    xhr.open('POST', '/GameSpace/form_handlers/adminHandler.php');
    xhr.send(data);

}