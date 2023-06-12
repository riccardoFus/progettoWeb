<jsp:include page="header.jsp"/>
<div class="flex-container" id="areaP">
    <%
        // se la sessione dell'utente ha come attributo typeOfUser == simpatizzante allora significa che posso mostrarli la pagina privata
        // altrimenti può essere che si sia fatto accesso diretto mettendo l'url con <path>/AreaPersonaleSim senza fare l'accesso,
        // in quel caso mostriamo all'utente un alert

        String[] URI = (request.getRequestURL().toString()).split("/");
        String pagina = URI[URI.length - 1];
        if (pagina.contains("jsessionid")) {%>
    <label id="text1">Siamo spiacenti, è necessario accettare i cookie per poter accedere a questa pagina</label>
    <%

    } else if (session.getAttribute("typeOfUser") == "simpatizzante") {

    %>
    <div id="data" <% if ((Boolean) session.getAttribute("acceptCookies") == false)%> disabled>
        <!-- Bottone per mostrare i dati personali dell'aderente -->
        <button onclick="showInfo()" class="button">DATI PERSONALI</button>
    </div>

    <div class="column">
        <!-- Serie di bottoni per permettere all'aderente di iscriversi alle attività -->
        <h3>ISCRIVITI/DISISCRIVITI</h3>
        <div class="row">
            <label>Water Week</label>
            <!-- Se effettua click sul bottone si iscrive all'attività eseguendo subUnsub(this) -->
            <input type="checkbox" value="waterweek" onclick="subUnsub(this)" class="iscriz">
        </div>

        <div class="row">
            <label>Feed Your Brain</label>
            <!-- Se effettua click sul bottone si iscrive all'attività eseguendo subUnsub(this) -->
            <input type="checkbox" value="feedyourbrain" onclick="subUnsub(this)" class="iscriz">
        </div>

        <div class="row">
            <label>Mind Checkup</label>
            <!-- Se effettua click sul bottone si iscrive all'attività eseguendo subUnsub(this) -->
            <input type="checkbox" value="mindcheckup" onclick="subUnsub(this)" class="iscriz">
        </div>
    </div>
    <!-- Bottone per permettere all'utente di disiscriversi dal sito, dopo aver eseguito la funzione js, viene reindirizzato all'homepage l'utente stesso-->
    <button onclick="deleteAccount('<%= response.encodeURL("Home.jsp")%>')" class="button">DISISCRIVITI</button>
    <%
    } else {

    %>
    <!-- Messaggio di errore nel caso di accesso anomalo -->
    <label id="text1">Siamo spiacenti, è necessario essere simpatizzanti per poter accedere a questa pagina</label>
    <% } %>
</div>
<jsp:include page="footer.jsp"/>
</div>

<script src="./javascript/paginaPrivata.js"></script>
