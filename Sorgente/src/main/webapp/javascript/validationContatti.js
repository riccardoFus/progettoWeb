function isEmpty(s) {
    return ((s == null) || (s.length == 0));
}

function isValidEmail(s) {
    // regular expression per checkare se una stringa è una mail o no
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(s)) return (true);
    else {
        showWarning("Formato email non valido", "warnEmail")
        return false;
    }
}

function check(field, s) {
    // per name e surname, l'unica cosa da controllare è il loro essere non vuoti
    let msg = "Campo obbligatorio"
    if (isEmpty(field.value)) {
        if (s === "Email")
            showWarning(msg, "warnEmail")
        else if (s === "Nome")
            showWarning(msg, "warnNome")
        else
            showWarning(msg, "warnCognome")
        return false
    } else return true;
}

function checkEmail(field, s) {
    // per l'email ho un check diverso perché ho la regular expression
    if (isValidEmail(field.value)) return true;
    else return false;
}

function validatePageContatti(form) {
    // restituisco la validazione dei vari campi del form presente nella pagina contatti
    let esitoN = check(form.elements["name"], "Nome")
    if (esitoN) {
        document.getElementById("warnNome").style.visibility = "hidden";
    }
    let esitoC = check(form.elements["surname"], "Cognome")
    if (esitoC) {
        document.getElementById("warnCognome").style.visibility = "hidden";

    }

    let esitoE = check(form.elements["email"], "Email") && checkEmail(form.elements["email"], "Email");
    if (esitoE) {
        document.getElementById("warnEmail").style.visibility = "hidden";
    }
    return esitoC && esitoE && esitoN
}


function showWarning(msg, id) {
    //imposta il messaggio dello warning emostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}


function reset() {
    //reset a vuoto di tutti i campi
    let form = document.getElementsByTagName("form").item(0);
    for (let el of form.elements) {
        if(el.type !== "submit")
            el.value = ""

    }
    //reset tutti i warning
    let warnings = form.getElementsByClassName("warn");
    for (el of warnings) {
        el.style.visibility = "hidden";
    }
}
