<%
    // Se in questa sessione non ho mai mostrato l'informaztiva per
    //  l'utilizzo dei cookies, mostro la finestra all'utente
    String URI = request.getRequestURI();
    if (session.getAttribute("acceptCookies") == null) {
%>
<script>
    let bodyEl = document.getElementsByTagName("body")[0];
    let lockContent = document.createElement("div");
    lockContent.id = "lockContent"
    bodyEl.appendChild(lockContent);

    async function inviaConsenso(param) {
        let consensoJson = {"consenso": param}
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
                //rendi il resto interactable
                bodyEl.removeChild(lockContent)
                bodyEl.removeChild(document.getElementById("cookieWindow"))
                //se si rifiutano i cookie e jsessionid non è già presente nell'indirizzo (particolari casi di sessione scaduta e history dei link)
                let link = window.location.href
                if(consent === "false" && !link.includes("jsessionid"))
                    document.location.replace(link+";jsessionid=<%=session.getId()%>")


            })


    }
</script>
<div id="cookieWindow">
    <header>COOKIE POLICY</header>
    <p>Utilizziamo cookie e altre tecnologie simili per fornire i nostri servizi. Se accetti, utilizzeremo i cookie
        anche per ottimizzare la tua esperienza online sul nostro sito.</p>
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