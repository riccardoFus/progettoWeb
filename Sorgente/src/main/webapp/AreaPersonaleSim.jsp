<jsp:include page="header.jsp"/>
<div class="flex-container" id="areaP">
    <%
        session = request.getSession();

        if (session.getAttribute("typeOfUser") == "simpatizzante") {

    %>
    <div id="data">
        <button onclick="showInfo()" class="button">Dati Personali</button>
    </div>

    <div class="column">
        <h3>ISCRIVITI/DISISCRIVITI</h3>
        <div class="row">
            <label>Water Week</label>
            <input type="checkbox" value="waterweek" onclick="subUnsub(this)" class="iscriz">
        </div>

        <div class="row">
            <label>Feed Your Brain</label>
            <input type="checkbox" value="feedyourbrain" onclick="subUnsub(this)" class="iscriz">
        </div>

        <div class="row">
            <label>Mind Checkup</label>
            <input type="checkbox" value="mindcheckup" onclick="subUnsub(this)" class="iscriz">
        </div>
    </div>
    <button onclick="deleteAccount()" class="button">Disiscriviti</button>
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere simpatizzanti per poter accedere a questa pagina</label>
    <% } %>
</div>

<script src="./javascript/paginaPrivata.js"></script>
<jsp:include page="footer.jsp"/>