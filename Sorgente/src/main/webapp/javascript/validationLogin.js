function isEmpty(x){
    if(x==="")
        return true;
    else
        return false;
}

function checkInput(field, dataType){
    if(isEmpty(field.value)){
        document.getElementById("labelError").innerHTML = "07: " + dataType + " mancante! Si prega di ricompilare";
        return false;
    }else{
        document.getElementById("labelError").innerHTML = "";
        return true;
    }
}

    function checkLogin(){
        let form = document.getElementById("form");
        return checkInput(form.elements.namedItem("username"), 'Username') && checkInput(form.elements.namedItem("password"), 'Password') && checkLoginValid(form);
}

    function checkLoginValid(form){
    //Riceve l'errore
        let esito = true;
        let response;
        let url = "logIn?username="+form.elements.namedItem("username").value+"&password="+form.elements.namedItem("password").value;
        let xhttp = new XMLHttpRequest();
        xhttp.open("GET", url, false);
        xhttp.onreadystatechange = function(){
            if(this.readyState===4 && this.status===200){
                response = this.response;
                if(response === ""){
                    document.getElementById("labelError").innerHTML="";
                }
                else{
                    document.getElementById("labelError").innerHTML=response.split("\"")[1];
                }
            }
        };
        xhttp.send();
        if(response === ""){
            esito = true;
        }else{
            esito = false;
        }
        return esito;

    }