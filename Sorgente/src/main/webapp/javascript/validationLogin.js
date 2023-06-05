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
    //imposta il messaggio dello warning e mostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}

function checkLoginValid(form){
    //Riceve l'errore
        let esito = true;
        let response = "";
        let url = "logIn?username="+form.elements.namedItem("username").value+"&password="+form.elements.namedItem("password").value;
        let xhttp = new XMLHttpRequest();
        xhttp.open("GET", url, false);
        xhttp.onreadystatechange = function(){
            if(this.readyState===4 && this.status===200){
                response = this.response;
                if(response.split("\"")[1] === ""){
                }else{
                    showWarning(response.split("\"")[1], "warnNome");
                    document.getElementById("username").style.color="salmom";
                    document.getElementById("warnNome").style.color="salmon";
                }
            }
        };
        xhttp.send();
        if(response.split("\"")[1] === ""){
            esito = true;
        }else{
            esito = false;
        }
        return esito;

}