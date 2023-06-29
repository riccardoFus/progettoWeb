//al caricamento della pagina vengono cercate tutte le info (comprese le iscrizioni) e riempe l'oggetto client
let cliente = {}
let iscrizioni
//richiesta fetch che ritorna tutti i valori

function setup(url){
    requestData(url).then(
        () => {
            //check/uncheck a seconda delle iscrizioni
            iscrizioni = document.getElementsByClassName("iscriz");
            iscrizioni.item(0).checked = cliente.iscrizWW
            iscrizioni.item(1).checked = cliente.iscrizFYB
            iscrizioni.item(2).checked = cliente.iscrizMC

        }
    )

}

//fetch funzione per unsub/SUB
async function subUnsub(elem, url) {
    //fetch

    await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify({
            "operazione": "subUnsub",
            "campo": elem.value,
            "nuovoVal": (elem.checked).toString()
        })
    }).then(resp => resp.json())
        .then(respInfo => {
                // riceve risposta

            }
        )


}

function deleteAccount(link, url) {
    fetch(url, {
        method: 'post',
        body: JSON.stringify({
            "operazione": "deleteAccount"
        }),
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }

    }).then(resp => resp.json())
        .then(respInfo => {
                // riceve risposta
                window.location= link;

            }
        )

}

function createElements(divDati) {
    for (let i = 0; i < 5; i++) {
        let divRow = document.createElement("div")
        divRow.className = "row"

        let label = document.createElement("label")
        //nome label
        let name = "";
        switch (i) {
            case 0:
                name = "USERNAME"
                break;

            case 1:
                name = "NOME"
                break;

            case 2:
                name = "COGNOME"
                break;

            case 3:
                name = "DATA DI NASCITA"
                break;

            case 4:
                name = "NUMERO DI TELEFONO"
                break;

            default:
                break;
        }

        label.innerHTML = name;
        let val = document.createElement("p")
        val.className = "info";
        //Aggiungi il tutto ai div
        divRow.appendChild(label)
        divRow.appendChild(val)
        divDati.appendChild(divRow)
    }
}

async function requestData(url) {
    //fetch
    await fetch(url, {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        }
    }).then( resp => resp.json())
        .then(respInfo => {
                //riempi l'oggetto cliente
            console.log(respInfo)
                cliente.nome = respInfo.nome
                cliente.cognome = respInfo.cognome
                cliente.dataDiNascita = respInfo.dataDiNascita
                cliente.numTel = respInfo.numTel
                cliente.iscrizWW = respInfo.iscrizWW
                cliente.iscrizFYB = respInfo.iscrizFYB;
                cliente.iscrizMC = respInfo.iscrizMC;
                cliente.username = respInfo.username;

            }
        )

}

function showInfo() {
    // query per richiedere i dati
    //aggiungi i vari label per i dati
    let divDati = document.getElementById("data");
    //generi solo se non sono già stati generati
    if (divDati.childElementCount === 1){
        createElements(divDati)
        //riempi i campi con le informazioni in cliente
        let campi = document.getElementsByClassName("info");
        campi.item(0).innerHTML = cliente.username;
        campi.item(1).innerHTML = cliente.nome;
        campi.item(2).innerHTML = cliente.cognome;
        campi.item(3).innerHTML = cliente.dataDiNascita;
        campi.item(4).innerHTML = cliente.numTel;
    }else{
        //le info sono già presenti, controlla se il contenitore dei dati è visibile
        let infoCont =data.getElementsByClassName("row");
        for( let c of infoCont) {
            if (c.style.visibility === "collapse") {
                //nascondi
                c.style.visibility = "visible"
            } else
                c.style.visibility = "collapse"
        }
    }
}

async function donate(url) {
    // prende da input il valore inserito
    let somma = document.getElementsByName("donazione")[0].valueAsNumber
    //fetch

    await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify({
            "operazione": "donate",
            "somma": somma
        })
    }).then(resp => resp.json())
        .then(respInfo => {
                // riceve risposta
                alert(respInfo.msg)

            }
        )

}
