<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="flex-container" id="areaP">
    <%
        // ottengo la sessione attuale dell'utente
        session = request.getSession();

        // se la sessione dell'utente ha come attributo typeOfUser == admin allora significa che posso mostrarli la pagina privata
        // altrimenti può essere che si sia fatto accesso diretto mettendo l'url con <path>/AreaPersonaleAdmin senza fare l'accesso,
        // in quel caso mostriamo all'utente un alert
        if (session.getAttribute("typeOfUser") == "admin") {

    %>

    <div class="row">
        <!-- Bottone per mostrare il numero totale di visite al sito -->
        <input type="submit" class="button" value="Visite" onclick="showTotalViewers()">
        <!-- Bottone per azzerare il numero totale di visite al sito -->
        <input type="submit" class="button" value="Reset" onclick="resetValues()">
    </div>

    <div id="textCont" class="row">
        <!-- Paragrafi di appoggio richiamati dalle funzioni js per mostrare dei messaggi di testo -->
        <p id="text"> </p>
        <p id="views"> </p>
    </div>

    <div class="row">
        <!-- Bottone per mostrare la lista di tutti gli iscritti al sito -->
        <input type="submit" class="button" value="Iscritti" onclick="showTotalSubscriptions()">
        <!-- Bottone per mostrare la lista di tutti i simpatizzanti del sito -->
        <input type="submit" class="button" value="Aderenti" onclick="showAderenteSubscriptions()">
        <!-- Bottone per mostrare la lista di tutti gli aderenti del sito -->
        <input type="submit" class="button" value="Simpatizzanti" onclick="showSimpatizzanteSubscriptions()">
    </div>

    <!-- Tabella di appoggio usata per mostrare i vari utenti -->
    <table id="showUsers"></table>

    <div class="row">
        <!-- Bottone per mostrare il grafico delle visite -->
        <input type="submit" class="button" value="Grafico Visite" onclick="showIstogrammaVisite()">
        <!-- Bottone per mostrare il grafico delle donazioni -->
        <input type="submit" class="button" value="Grafico Donazioni" onclick="showIstogrammaDonazioni()">
    </div>
    <div id="divContGrafico">
        <!-- Div di appoggio usato per mostrare i vari grafici -->
        <div id="divGrafico"></div>
    </div>
    <%
    } else {

    %>
    <!-- Messaggio di errore nel caso di accesso anomalo -->
    <label id="text1">Siamo spiacenti, è necessario essere amministratori per poter accedere a questa pagina</label>
    <% }%>

    <script src="./javascript/statistics.js"></script>
    <script src="./javascript/highcharts.js"></script>
</div>
<jsp:include page="footer.jsp"/>
</div>


