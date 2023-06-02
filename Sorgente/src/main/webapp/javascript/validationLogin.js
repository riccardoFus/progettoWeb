function isEmpty(x){
    if(x==="")
        return true;
    else
        return false;
}

function checkLogin(form){
    let esito = true
    let msg = "Campo obbligatorio"

    if(isEmpty(form.elements['username'].value)){
        showWarning(msg, "warnNome");
        esito=false;

    }else{
        document.getElementById("warnNome").style.visibility = "hidden";

    }

    if(isEmpty(form.elements['password'].value)){
        showWarning(msg, "warnPsw");
        esito=false;
    }else{
        document.getElementById("warnPsw").style.visibility = "hidden";
    }

    esito = esito && checkLoginValid(form)

    return esito;

}

function showWarning(msg, id){
    //imposta il messaggio dello warning emostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}

function checkLoginValid(form){
    //Riceve l'errore
        let esito = true;
        let response;
        let url = "logIn?username="+form.elements.namedItem("username").value+"&password="+form.elements.namedItem("password").value;
        let xhttp = new XMLHttpRequest();
        xhttp.open("GET", url, true);
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