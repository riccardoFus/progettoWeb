function isEmpty(s) {
    return ((s == null) || (s.length == 0));
}

function isValidEmail(s){
    // regular expression per checkare se una stringa è una mail o no
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(s)) return (true);
    else return (false);
}

function warnNoValidForm(field, s){
    let message;
    // se il campo errato è l'email, do un messaggio diverso
    if(s=='Email')
        message = "Non hai inserito il valore nel campo " + s +", o hai inserito un format non valido";
    else
        message="Non hai inserito il valore nel campo " + s;
    // "focusso" il campo errato
    field.focus();
    // mostro il messaggio di errore
    alert(message)
    return false;
}

function check(field, s){
    // per name e surname, l'unica cosa da controllare è il loro essere non vuoti
    if(isEmpty(field.value)) return warnNoValidForm(field, s);
    else return true;
}

function checkEmail(field, s){
    // per l'email ho un check diverso perché ho la regular expression
    if(isValidEmail(field.value)) return true;
    else return warnNoValidForm(field, s);
}
function validatePageContatti(form) {
    // restituisco la validazione dei vari campi del form presente nella pagina contatti
    return check(form.elements["name"], "Nome")
        && check(form.elements["surname"], "Cognome")
        && check(form.elements["email"], "Email")
        && checkEmail(form.elements["email"], "Email");
}