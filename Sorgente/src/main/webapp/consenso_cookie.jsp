<%
  // Se in questa sessione non ho ricevuto il consenso per
  //  l'utilizzo dei cookies, mostro la finestra all'utente
  if (session.getAttribute("acceptCookies") == null) {
%>
<style>
  #cookieWindow {
    position: fixed;
    width: 300px;
    height: 200px;
    bottom: 0;
    right: 0;
    background-color: white;
    collapse: true;
    border: black;
  }
</style>
<script>
  function inviaConsenso(param) {

    let consenso = { consenso: param };

    let URL = window.location.origin + '/' + window.location.pathname.split('/')[1] + '/ConsensoCookie';

    let xhttp = new XMLHttpRequest();

    xhttp.open("POST", URL, true);
    xhttp.responseType = "json";

    xhttp.onreadystatechange = function () {
      let done = 4, ok = 200;
      if (this.readyState !== done || this.status !== ok){
        console.log(this.response)
      }
    };
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send(JSON.stringify(consenso));

    document.getElementById("cookieWindow").hidden = true;
  }
</script>
<div id="cookieWindow">
  <header>Cookie policy</header>
  <p>Il nostro sito utilizza dei Cookie per migliorare l'esperienza di navigazione. Si prega di accettare o declinare la cosa</p>
  <button onclick="inviaConsenso(true)" value="Accetta">Accetta</button>
  <button onclick="inviaConsenso(false)" value="Rifiuta">Rifiuta</button>
</div>
<%
  }
%>