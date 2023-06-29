function showTotalViewers() {
    // funzione per mostrare il numero totale di visite
    let url = "StatisticsServlet?action=totalViews";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let response = this.response;
            // rimuovo la richiesta precedentemente fatta
            pulisciMenu();
            // è presente un \n da eliminare
            response = response.split('\n')[0]
            // mostro il numero totali di visite
            showWarning(response, "views");
            showWarning("Visite totali del sito:", "text");
            document.getElementById("views").style.color = "salmom";
            document.getElementById("textCont").style.visibility = "visible";
        }
    }
    xhttp.send();
}

function showIstogrammaDonazioni() {
    // funzione per mostrare un grafico delle donazioni (abbiamo usato lo stesso grafico delle visite)
    let url = "StatisticsServlet?action=plotDonazioni";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonArray = this.response;
            // creo un array di 12 elementi (un elemento per ogni mese) e in base al mese metto le varie quote ricevute
            // inizialmente pongo tutti gli elementi a 0 per inserire anche i mesi senza donazioni
            let mesi = [];
            for (let i = 0; i < 12; i++) {
                mesi[i] = 0;
            }
            for (let i = 0; i < jsonArray.length; i++) {
                let current_JSON_object = JSON.parse(jsonArray[i]);
                mesi[new Date(current_JSON_object["data"]).getMonth()] += current_JSON_object["quota"];
            }

            // creo un hist mantenente corrispondenza mese - quota
            const chart = Highcharts.chart('divGrafico', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Grafico Donazioni'
                },
                xAxis: {
                    categories: ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre']
                },
                series: [{
                    name: 'Somma in euro',
                    data: [mesi[0], mesi[1], mesi[2], mesi[3], mesi[4], mesi[5], mesi[6], mesi[7], mesi[8], mesi[9], mesi[10], mesi[11]]
                }]
            });
        }
    }
    xhttp.send();
}

function showIstogrammaVisite() {
    let url = "StatisticsServlet?action=plot";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonArray = this.response;
            // creo due array paralleli per le pagine e le rispettive visite
            // visita[i] rappresenta il numero di visite di pagina[i]
            let pagine = [];
            let visite = [];
            for (let i = 0; i < jsonArray.length; i++) {
                let current_JSON_object = JSON.parse(jsonArray[i]);
                pagine[i] = current_JSON_object["page"];
                visite[i] = current_JSON_object["visits"];
            }
            // creo un hist mantenente corrispondenza pagina - visite
            const chart = Highcharts.chart('divGrafico', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Grafico visite'
                },
                xAxis: {
                    categories: pagine
                },
                series: [{
                    name: 'Visite',
                    data: visite
                }]
            });
        }
    }
    xhttp.send();
}

function showWarning(msg, id) {
    // imposta il messaggio dello warning e mostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}

function resetValues() {
    // funzione per azzerare visite sito
    let url = "StatisticsServlet?action=reset";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let response = this.response;
            // rimuovo la richiesta precedentemente fatta, inoltre se impostato reset cancello anche il grafico
            pulisciMenu("reset");
            // mostro il warning di reset
            showWarning(response, "views");
            document.getElementById("views").style.color = "salmom";
            document.getElementById("text").innerHTML = "";
        }
    }
    xhttp.send();
}

function setHeader(table, header) {
    // funzione per settare gli header della tabella (iscritti, simp, aderente)
    // riceve l'id della tabella e la lista degli header
    let head = table.createTHead();
    let row = head.insertRow();
    for (let campo of header) {
        let th = document.createElement("th");
        let text = document.createTextNode(campo);
        th.appendChild(text);
        row.appendChild(th);
    }
}

function showTotalSubscriptions() {
    // funzione per restituire la lista degli iscritti al sito
    let url = "StatisticsServlet?action=totalSubscriptions";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            let jsonArray = this.response;
            let table = document.getElementById("showUsers");

            // rimuovo la richiesta precedentemente fatta
            pulisciMenu();

            if (jsonArray === null) {
                document.getElementById("text").innerHTML = "Errore";
            } else {
                setHeader(table, ["Username", "Password", "Email"])
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object = JSON.parse(jsonArray[i]);
                    for (let key in current_JSON_object) {
                        let cell = row.insertCell();
                        let text = document.createTextNode(current_JSON_object[key]);
                        cell.appendChild(text);
                    }
                }
            }

        }
    }
    xhttp.send();
}


function showAderenteSubscriptions() {
    // funzione per restituire la lista degli aderenti
    let url = "StatisticsServlet?action=aderenteSubscriptions";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            let jsonArray = this.response;
            let table = document.getElementById("showUsers");
            // rimuovo la richiesta precedentemente fatta
            pulisciMenu();

            if (jsonArray === null) {
                document.getElementById("text").innerHTML = "Errore";
            } else {
                setHeader(table, ["Username", "Nome", "Cognome",  "Password", "Email", "Data Di Nascita", "Telefono", "Aderente"]);
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object = JSON.parse(jsonArray[i]);
                    for (let key in current_JSON_object) {
                        let cell = row.insertCell();
                        let text = document.createTextNode(current_JSON_object[key]);
                        cell.appendChild(text);
                    }
                }
            }

        }
    }
    xhttp.send();
}

function showSimpatizzanteSubscriptions() {
    // funzione per restituire la lista dei simpatizzanti
    let url = "StatisticsServlet?action=simpatizzanteSubscriptions";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            let jsonArray = this.response;
            let table = document.getElementById("showUsers");

            // rimuovo la richiesta precedentemente fatta
            pulisciMenu();

            if (jsonArray === null) {
                document.getElementById("text").innerHTML = "Errore";
            } else {
                setHeader(table, ["Username", "Nome", "Cognome", "Password","Email",  "Data Di Nascita", "Telefono", "Aderente"]);
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object = JSON.parse(jsonArray[i]);
                    for (let key in current_JSON_object) {
                        let cell = row.insertCell();
                        let text = document.createTextNode(current_JSON_object[key]);
                        cell.appendChild(text);
                    }
                }
            }

        }
    }
    xhttp.send();
}

function pulisciMenu(string) {
    // funzione per pulire le richieste precedentemente fatte e pulire il menu dell'admin
    let table = document.getElementById("showUsers");

    while (table.childNodes.length) {
        table.removeChild(table.childNodes[0]);
    }

    let cont = document.getElementById("textCont");
    if (string !== "reset") {
        cont.style.visibility = "collapse";
        document.getElementById("text").style.visibility = "hidden"
        document.getElementById("views").style.visibility = "hidden"
    }else{
        cont.style.visibility="visible"
    }
    if (string === "reset")
        document.getElementById("divGrafico").style.visibility = "hidden";
}

