<jsp:include page="header.jsp"/>

<div id="content" class="column">
    <%
        session = request.getSession();

        if (session.getAttribute("typeOfUser") == "aderente") {

    %>
    <div id="data">
        <button onclick="showInfo()" class="button">Dati Personali</button>
    </div>

    <div>
        <h3>Iscriviti/Disiscriviti</h3>
        <input type="checkbox" value="waterweek" onclick="subUnsub(this)" class="iscriz">
        <label>Water Week</label>
        <input type="checkbox" value="feedyourbrain" onclick="subUnsub(this)" class="iscriz">
        <label>Feed Your Brain</label>
        <input type="checkbox" value="mindcheckup" onclick="subUnsub(this)" class="iscriz">
        <label>Mind Checkup</label>
    </div>
    <button onclick="deleteAccount()" class="button">Disiscriviti</button>
    <button type="button">DONA</button>
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere aderenti per poter accedere a questa pagina</label>
    <% } %>
</div>
<jsp:include page="footer.jsp"/>