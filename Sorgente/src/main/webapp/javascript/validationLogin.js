function isEmpty(x){
    if(x==="")
        return true;
    else return false;
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

    return esito;

}

function showWarning(msg, id){
    //imposta il messaggio dello warning emostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}