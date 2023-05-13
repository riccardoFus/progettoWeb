function isEmpty(s) {
    return ((s == null) || (s.length == 0));
}

function isValidEmail(s){
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(s)) return (true);
    else return (false);
}

function warnNoValidForm(field, s){
    var message = "Non hai inserito il valore nel campo: " + s;
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
    return check(form.elements["name"], "name")
        && check(form.elements["surname"], "surname")
        && check(form.elements["email"], "email")
        && checkEmail(form.elements["email"], "email");
}