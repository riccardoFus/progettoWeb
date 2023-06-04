function showTotalViewers() {
    let url = "StatisticsServlet?action=totalViews";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, false);
    xhttp.onreadystatechange = function(){
        if(this.readyState===4 && this.status===200){
            let response = this.response;
            showWarning(response,"views");
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
            showWarning(response,"views");
            document.getElementById("views").style.color="salmom";
            document.getElementById("text1").style.display="none";
        }
    }
    xhttp.send();
}