function showTotalViewers() {
    let url = "StatisticsServlet?action=totalViews";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let response = this.response;
            pulisciMenu();
            showWarning(response,"views");
            showWarning("Visite totali del sito:","text");
            document.getElementById("views").style.color="salmom";
            document.getElementById("text").style.display="block";
            }
        }
    xhttp.send();
}

function showIstogrammaDonazioni() {
    let url = "StatisticsServlet?action=plotDonazioni";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let jsonArray = this.response;
            pulisciMenu();
            let mesi = [];
            for(let i = 0; i < 12; i++){
                mesi[i] = 0;
            }
            for (let i = 0; i < jsonArray.length; i++) {
                let current_JSON_object  = JSON.parse(jsonArray[i]);
                mesi[new Date(current_JSON_object["data"]).getMonth()] += current_JSON_object["quota"];
            }

            document.getElementById("divGrafico").style.visibility = "visible";

            const chart = Highcharts.chart('divGrafico', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Grafico Donazioni'
                },
                xAxis: {
                    categories:['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre']
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
            pulisciMenu();
            let pagine = [];
            let visite = [];
            for (let i = 0; i < jsonArray.length; i++) {
                let current_JSON_object  = JSON.parse(jsonArray[i]);
                pagine[i] = current_JSON_object["page"];
                visite[i] = current_JSON_object["visits"];
            }

            document.getElementById("divGrafico").style.visibility = "visible";
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

function showWarning(msg, id){
    //imposta il messaggio dello warning e mostralo
    let el = document.getElementById(id);
    el.innerText = msg;
    el.style.visibility = "visible";
}

function resetValues(){
    let url = "StatisticsServlet?action=reset";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let response = this.response;
            pulisciMenu("reset");
            showWarning(response,"views");
            document.getElementById("views").style.color="salmom";
            document.getElementById("text").innerHTML="";
        }
    }
    xhttp.send();
}
function setHeader(table, header){
    let head = table.createTHead();
    let row = head.insertRow();
    for (let campo of header) {
        let th = document.createElement("th");
        let text = document.createTextNode(campo);
        th.appendChild(text);
        row.appendChild(th);
    }
}

function showTotalSubscriptions(){
    let url = "StatisticsServlet?action=totalSubscriptions";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function(){
        if(xhttp.readyState===4 && xhttp.status===200){
            let jsonArray = this.response;
            let table = document.getElementById("showUsers");

            pulisciMenu("no");

            if(jsonArray === null){
                document.getElementById("text").innerHTML="Errore";
            }
            else{
                setHeader(table, ["Username","Password","Email"])
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object  = JSON.parse(jsonArray[i]);
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



function showAderenteSubscriptions(){
    let url = "StatisticsServlet?action=aderenteSubscriptions";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function(){
        if(xhttp.readyState===4 && xhttp.status===200){
            let jsonArray = this.response;
            let table = document.getElementById("showUsers");
            pulisciMenu("no");

            if(jsonArray === null){
                document.getElementById("text").innerHTML="Errore";
            }
            else{
                setHeader(table, ["Username","Nome","Cognome","Email","Password","Data Di Nascita", "Telefono", "Aderente"]);
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object  = JSON.parse(jsonArray[i]);
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

function showSimpatizzanteSubscriptions(){
    let url = "StatisticsServlet?action=simpatizzanteSubscriptions";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function(){
        if(xhttp.readyState===4 && xhttp.status===200){
            let jsonArray = this.response;
            let table = document.getElementById("showUsers");

            pulisciMenu("no");

            if(jsonArray === null){
                document.getElementById("text").innerHTML="Errore";
            }
            else{
                setHeader(table, ["Username","Nome","Cognome","Email","Password","Data Di Nascita", "Telefono", "Aderente"]);
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object  = JSON.parse(jsonArray[i]);
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

function pulisciMenu(string){
    let table = document.getElementById("showUsers");

    while(table.childNodes.length){
        table.removeChild(table.childNodes[0]);
    }

    let label1 = document.getElementById("views");
    label1.style.visibility = "hidden";
    let label2 = document.getElementById("text");
    label2.style.visibility = "hidden";
    if(string === "reset")
        document.getElementById("divGrafico").style.visibility = "hidden";
}

