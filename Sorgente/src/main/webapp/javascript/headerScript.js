// Aggiorna la frase nell'intestazione delle pagine ogni 20 secondi
function updatePhrase() {
    let jsonObject;
    let URL = window.location.origin + '/' + window.location.pathname.split('/')[1] + '/PhraseFetcher';
    let xhttp = new XMLHttpRequest();

    xhttp.open("GET", URL, true);
    xhttp.responseType = "json";

    xhttp.onreadystatechange = function () {
        let done = 4, ok = 200;
        if (this.readyState === done && this.status === ok) {
            jsonObject = this.response;

            document.getElementById("phraseHeader").innerText =
                jsonObject.frase;
        }
    };

    xhttp.send();
}

updatePhrase();
window.setInterval(updatePhrase, 20000);


/* Script ser tenere slezionata la parte di pagina dove ti trovi nell'header*/

let pos = 0
//togli session id se presente
let noSessionId = window.location.pathname.split(";")[0];
let path = noSessionId.split("/")[2];

if(path.search("Home") !== -1 || path === ""){
    pos=0
}else if(path.search("ChiSiamo") !== -1){
    pos=1
}else if(path.search("Contatti") !== -1){
    pos=3

}else if(path.search("AreaPersonale") !== -1 || path.search("SignIn") !== -1){
    pos = 4
}else if(path.search("Login") !== -1){
    pos=5
}else{
    pos=2
}

 // modifica l'header
let links = (document.getElementById("header")).getElementsByTagName("a")
links.item(pos).id="selected"


async function logout(btn){
    //fetch
    let url = "paginaPrivata";
    event.preventDefault()

    await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify({
            "operazione": "logout"
        })
    }).then(resp => resp.json())
        .then(respInfo => {
                // riceve risposta
                alert(respInfo.msg)
                if(respInfo.msg === "Logout completato")
                    window.location=btn.href

            }
        )


}