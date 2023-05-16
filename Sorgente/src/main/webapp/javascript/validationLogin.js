function isEmpty(x){
    if(x=="")
        return true;
    else return false;
}

function checkInput(field, dataType){
    if(isEmpty(field.value) && dataType=='username'){
        setAlert('usernameMissing');
    }

    else if(isEmpty(field.value) && dataType=='password'){
        setAlert('passwordMissing');
    }
}

function setAlert(trigger) {
    switch (trigger) {
        case 'usernameMissing':
            return alert("Username mancante! Si prega di compilarlo");
            break;
        case 'passwordMissing':
            return alert("Password mancante! Si prega di inserirla");
    }
}
    function checkLogin(form){
        return checkInput(form.elements['username'],'username') || checkInput(form.elements['password'], 'password');
}