<jsp:include page="header.jsp"/>
<div class="flex-container" id="areaP">
    <%
        session = request.getSession();

        if (session.getAttribute("typeOfUser") == "aderente") {

    %>
    <div id="data">
        <button onclick="showInfo()" class="button">DATI PERSONALI</button>
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

        <div class="row">
            <input type="number" value="0" name="donazione" class="textbox">
            <button onclick="donate()" class="button">Dona</button>
        </div>
    </div>
    <button onclick="deleteAccount()" class="button">DISISCRIVITI</button>
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere aderenti per poter accedere a questa pagina</label>
    <% } %>
</div>
<jsp:include page="footer.jsp"/>
</div>
<script src="./javascript/paginaPrivata.js"></script>