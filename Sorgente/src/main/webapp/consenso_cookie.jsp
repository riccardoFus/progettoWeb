<%
  // Se in questa sessione non ho ricevuto il consenso per
  //  l'utilizzo dei cookies, mostro la finestra all'utente
  if (session.getAttribute("acceptCookies") == null) {
%>
<script>
    async function inviaConsenso(param){
    let consensoJson = {"consenso" : param}
    //fetch
    let url = "ConsensoCookie";

    await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(consensoJson)
    }).then(resp => resp.json())
            .then(consent => {
              document.getElementById("cookieWindow").style.visibility = 'hidden';
            })
    }
</script>
<div id="cookieWindow">
  <header>COOKIE POLICY</header>
  <p>Utilizziamo cookie e altre tecnologie simili per fornire i nostri servizi. Se accetti, utilizzeremo i cookie anche per ottimizzare la tua esperienza online sul nostro sito.</p>
  <div class="row">
    <!-- Se clicco su accetta, viene inviato consenso = true -->
    <button onclick="inviaConsenso(true)" class="button" value="Accetta">Accetta</button>
    <!-- Se clicco su rifiuta, viene inviato consenso = false -->
    <button onclick="inviaConsenso(false)" class="button" value="Rifiuta">Rifiuta</button>
  </div>
</div>
<%
  }
%>