function isEmpty(s) {
    return ((s == null) || (s.length == 0));
}

function isValidEmail(s){
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(s)) return (true);
    else return (false);
}

function warnNoValidForm(field, s){
    let message = "Non hai inserito il valore nel campo " + s;
    field.focus();
    alert(message)
    return false;
}

function check(field, s){
    if(isEmpty(field.value)) return warnNoValidForm(field, s);
    else return true;
}

function checkEmail(field, s){
    if(isValidEmail(field.value)) return true;
    else return warnNoValidForm(field, s);
}
function validatePageContatti(form) {
    return check(form.elements["name"], "Nome")
        && check(form.elements["surname"], "Cognome")
        && check(form.elements["email"], "Email")
        && checkEmail(form.elements["email"], "Email");
}