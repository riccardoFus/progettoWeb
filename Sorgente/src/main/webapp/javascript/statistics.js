function showTotalViewers() {
    let url = "StatisticsServlet?action=totalViews";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, false);
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let response = this.response;
            pulisciMenu();
            showWarning(response,"views");
            showWarning("Visite totali del sito:","text1");
            document.getElementById("views").style.color="salmom";
            document.getElementById("text1").style.display="block";
            }
        }
    xhttp.send();
}

function showIstogramma() {
    let url = "StatisticsServlet?action=plot";
    let xhttp = new XMLHttpRequest();
    xhttp.open("POST", url, false);
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let response = this.response;
            pulisciMenu();
            showWarning(response,"views");
            document.getElementById("istogramma").style.color="salmom";
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
    xhttp.open("GET", url, false);
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let response = this.response;
            pulisciMenu();
            showWarning(response,"views");
            document.getElementById("views").style.color="salmom";
            document.getElementById("text1").innerHTML="";
        }
    }
    xhttp.send();
}
function setHeader(table, header){
    let head = table.createTHead();
    let row = head.insertRow();
    for (let campo of header) {
        let th = document.createElement("th");
        th.style.border = "1px solid";
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

            pulisciMenu();

            if(jsonArray === null){
                document.getElementById("text1").innerHTML="Errore";
            }
            else{
                table.style.border="1px";
                setHeader(table, ["Username","Password","Email"])
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object  = JSON.parse(jsonArray[i]);
                    for (let key in current_JSON_object) {
                        let cell = row.insertCell();
                        cell.style.border = "1px solid";
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

            pulisciMenu();

            if(jsonArray === null){
                document.getElementById("text1").innerHTML="Errore";
            }
            else{
                table.style.border="1px";
                setHeader(table, ["Username","Nome","Cognome","Email","Password","Data Di Nascita", "Telefono", "Aderente"]);
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object  = JSON.parse(jsonArray[i]);
                    for (let key in current_JSON_object) {
                        let cell = row.insertCell();
                        cell.style.border = "1px solid";
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

            pulisciMenu();

            if(jsonArray === null){
                document.getElementById("text1").innerHTML="Errore";
            }
            else{
                table.style.border="1px";
                setHeader(table, ["Username","Nome","Cognome","Email","Password","Data Di Nascita", "Telefono", "Aderente"]);
                for (let i = 0; i < jsonArray.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object  = JSON.parse(jsonArray[i]);
                    for (let key in current_JSON_object) {
                        let cell = row.insertCell();
                        cell.style.border = "1px solid";
                        let text = document.createTextNode(current_JSON_object[key]);
                        cell.appendChild(text);
                    }
                }
            }

        }
    }
    xhttp.send();
}

function pulisciMenu(){
    let table = document.getElementById("showUsers");

    while(table.childNodes.length){
        table.removeChild(table.childNodes[0]);
    }
    table.style.borser = "0px solid";

    let label1 = document.getElementById("views");
    label1.style.visibility = "hidden";
    let label2 = document.getElementById("text1");
    label2.style.visibility = "hidden";
}