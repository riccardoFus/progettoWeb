function validate(){
    let form = document.getElementById("form");

    // esito scritto invece di return a&& b && c ... per forzare la chiamata di tutte le funzioni in modo che diano tutti warning

    let esitoDate = validateDate(form);
    let esitoNSU =  validateNSU(form);
    let esitoPsw= validatePsw(form);
    let esitoTel=validateTel(form);
    let esitoEmail = validateEmail(form);
    let esitoCheck=validateCheckbox();

    return esitoDate && esitoTel && esitoPsw && esitoNSU && esitoEmail&& esitoCheck;

}

function validateEmail(form){
    let elem = form.elements.namedItem("email");
    if(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(elem.value)) {
        //reset warning se attivi
        document.getElementById("warnEmail").style.visibility = "hidden";
        return true;
    }else{
        let msg;
        if(elem.value === "")
            msg="Campo obbligatorio";
        else
            msg="Formato email non valido";
        showWarning(msg, "warnEmail");
        return false;
    }
}
function validateDate(form){
    // prendi l'elemento della pagina
    let elem = form.elements.namedItem("data di nascita");

    //controlla che sia stata inserita
    if(elem.value !== ""){
        //controlla che l'uente sia maggiorenne:
        let oggi = Date.now();
        // value con input date ritorna la stringa composta da anno-giorno-mese
        // estraiamo le varie sottostringhe separate da '-'
        // ricaviamo una "soglia": ovvero g, m, a che devono essere passati perchè l'utente sia maggiorenne
        // N.B mesi sono rappresentati con  valori 0-11
        let nascita = elem.value.split("-");
        let sogliaData = new Date(parseInt(nascita[0]) + 18,  parseInt(nascita[2]) - 1, parseInt(nascita[1]) );

        if(oggi - sogliaData.getTime()>= 0) {
            document.getElementById("warnData").style.visibility = "hidden";
            return true;
        }else {
            showWarning("Iscrizione consentita solo ai maggiorenni", "warnData")
            return false;
        }
    }else{
        showWarning("Campo obbligatorio", "warnData")
        return false;
    }

}

function validateNSU(form){
    // prendi Nome, Cognome e Username
    let elemN = form.elements.namedItem("nome");
    let elemC = form.elements.namedItem("cognome");
    let elemU = form.elements.namedItem("username");

    //controlla che siano stati inseriti tutti i campi

    let esito = true;
    if(elemN.value === ""){
        esito = false;
        showWarning("Campo obbligatorio", "warnNome");
    }else{
        document.getElementById("warnNome").style.visibility = "hidden";
    }

    if(elemC.value === ""){
        esito = false;
        showWarning("Campo obbligatorio", "warnCogn")
    }else{
        document.getElementById("warnCogn").style.visibility = "hidden";
    }

    if(elemU.value === ""){
        esito = false;
        showWarning("Campo obbligatorio", "warnUser")
    }else{
        //url = url servlet + parametro da analizzare
        let responseU;
        let url = "signIn?username=" + elemU.value;
        let xhttp = new XMLHttpRequest();
        xhttp.open("GET", url, false);
        xhttp.onreadystatechange = function () {
            var done = 4, ok = 200;
            if (this.readyState === done && this.status === ok)
            {
                /* la risposta include le "" come parte della stringa quindi le eliminiamo
                * */
                responseU = this.response;
                let purifyResp =responseU.split("\"");
                if( purifyResp[1] === "true"){
                    //user con lo stesso esername trovato
                    alert("esiste un altro user " + responseU);
                    esito = false;
                    showWarning("Username già utilizzato", "warnUser");
                    document.getElementById("username").style.color="darkmagenta";
                    document.getElementById("warnUser").style.color="darkmagenta";

                }else{
                    //tutto ok
                    alert("non esiste un altro user " + responseU);
                    document.getElementById("warnUser").style.visibility = "hidden";
                    document.getElementById("username").style.color="black";
                    document.getElementById("warnUser").style.color="darkslateblue";
                }

            }
        };
        xhttp.send();
    }

    return esito;

}

function validatePsw(form){
    // prendi psw e conferma psw

    let elemP = form.elements.namedItem("psw");
    let elemPC = form.elements.namedItem("psw confermata");

    //controlla che sia stata inserita
    if(/^(?=.*[Cc])(?=.*[sS])(?=.*[dD])(?=.*[rR])(?=.*[A-Z])(?=.*\d)(?=.*[$!?])[\w\W]{8}$/.test(elemP.value)){
        document.getElementById("warnPsw").style.visibility = "hidden";
        if (elemP.value === elemPC.value) {
            document.getElementById("warnPswConf").style.visibility = "hidden";
            return true;
        }else{
            //no matching
            showWarning("Password non combaciano", "warnPswConf");
            return false;
        }
    }else{
        //formato psw non rispettato
        let msg;
        if(elemP.value === "")
            msg="Campo obbligatorio";
        else
            msg="Formato password non rispettato";

        showWarning(msg, "warnPsw");
        return false;
    }

}
function validateTel(form){
    let elem = form.elements.namedItem("telefono");

    /*standard E.164 internazionale:
    numeri di telefono accettati sono in formato [+][codice nazione 1-4 cifre][codice area][numero cell locale]*/

    if(/^[\+]?[(]?[0-9]{1,4}[)]?[-\s\.]?[0-9]{1,5}[-\s\.]?[0-9]{1,6}$/.test(elem.value)) {
        document.getElementById("warnTel").style.visibility = "hidden";
        return true;
    }else{
        let msg;
        if(elem.value === "")
            msg="Campo obbligatorio";
        else
            msg="Numero telefonico non valido";

        showWarning(msg, "warnTel");
        return false;
    }
}

function reset(){
    //reset a vuoto di tutti i campi
    let form = document.getElementById("form");
    form.elements.namedItem("psw").setAttribute("value", "");
    form.elements.namedItem("psw confermata").setAttribute("value", "");
    form.elements.namedItem("telefono").setAttribute("value", "");
    form.elements.namedItem("username").setAttribute("value", "");
    form.elements.namedItem("nome").setAttribute("value", "");
    form.elements.namedItem("cognome").setAttribute("value", "");
    form.elements.namedItem("data di nascita").setAttribute("value", "");
    form.elements.namedItem("email").setAttribute("value", "");
    document.getElementById("simp").setAttribute("checked", false);
    document.getElementById("ader").setAttribute("checked", false);

    //reset tutti i warning
    let warnings = document.getElementsByClassName("warn");
    for (let el of warnings){
        el.style.visibility="hidden";
    }
}
function validateCheckbox(){
    let check1 = document.getElementById("simp").checked;
    let check2 = document.getElementById("ader").checked;
    if( check1 === true || check2=== true) {
        //reset warning se attivi
        document.getElementById("warnSott").style.visibility = "hidden";
        return true;
    }else{
        showWarning("Campo obbligatorio", "warnSott")
        return false;
    }
}

function showWarning(msg, id){
    //imposta il messaggio dello warning emostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}