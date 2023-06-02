// query per richiedere i dati

let respInfo;
let url = "paginaPrivata";
let xhttp = new XMLHttpRequest();
xhttp.open("GET", url, true);
xhttp.onreadystatechange = function () {
    var done = 4, ok = 200;
    if (this.readyState === done && this.status === ok) {
        /* chiami la servlet per fare la query al db, e poi modifichi tutti i campi appropriati con le info
        * */
        respInfo = JSON.parse(this.response);
        let campi = document.getElementsByClassName("info");
        campi.item(0).innerHTML=respInfo.username;
        campi.item(1).innerHTML=respInfo.nome;
        campi.item(2).innerHTML=respInfo.cognome;
        campi.item(3).innerHTML=respInfo.dataDiNascita;
        campi.item(4).innerHTML=respInfo.numTel;

        let iscrizioni = document.getElementsByClassName("iscriz");
        iscrizioni.item(0).checked = respInfo.iscrizWW;
        iscrizioni.item(1).checked = respInfo.iscrizFYB;
        iscrizioni.item(2).checked = respInfo.iscrizMC;

    }
};
xhttp.send();

function subUnsub(elem){

    let responseVal;
    let url = "paginaPrivata";

    fetch(url, {
        method: 'post',
        body: {
            "operazione" : "subUnsub",
            "campo" : elem.value,
            "nuovoVal": (!elem.checked).toString()
        },
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }

    }).then((response) => {
        responseVal = response.json()
        let pos = 0
        switch (elem.value) {
            case "Water Week":
                pos = 0
                break;
            case "Feed Your Brain":
                pos = 1
                break;
            case "Mind Checkup":
                pos = 2
                break;

        }

        let iscrizioni = document.getElementsByClassName("iscriz");
        iscrizioni.item(pos).checked = !iscrizioni.item(pos).checked;

    }).catch((error) => {
        console.log(error)

    })
}

function deleteAccount(){
    let responseVal;
    let url = "paginaPrivata";

    fetch(url, {
        method: 'post',
        body: {
            "operazione" : "deleteAccount"
        },
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }

    }).then((response) => {
        responseVal = response.json()

    }).catch((error) => {
        console.log(error)

    })

}