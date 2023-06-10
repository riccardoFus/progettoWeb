<%
  // Se in questa sessione non ho ricevuto il consenso per
  //  l'utilizzo dei cookies, mostro la finestra all'utente
  if (session.getAttribute("acceptCookies") == null) {
%>
<script>
  function inviaConsenso(param) {

    let consenso = { consenso: param };

    let URL = "ConsensoCookie";

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

    document.getElementById("cookieWindow").style.visibility = 'hidden';
  }
</script>
<div id="cookieWindow">
  <header>COOKIE POLICY</header>
  <p>Utilizziamo cookie e altre tecnologie simili per fornire i nostri servizi. Se accetti, utilizzeremo i cookie anche per ottimizzare la tua esperienza online sul nostro sito.</p>
  <div class="row">
    <button onclick="inviaConsenso(true)" class="button" value="Accetta">Accetta</button>
    <button onclick="inviaConsenso(false)" class="button" value="Rifiuta">Rifiuta</button>
  </div>
</div>
<%
  }
%>