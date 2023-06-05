<jsp:include page="header.jsp"/>
<div>
    <%
        session = request.getSession();

        if (session.getAttribute("userType")== ("aderente") || session.getAttribute("userType")=="admin") {

    %>
    <a>Dati personali</a>
    <div>
        <h3>Iscriviti/Disiscriviti</h3>
        <input type="checkbox" value="Water Week">
        <label>Water Week</label>
        <input type="checkbox" value="Feed Your Brain">
        <label>Feed Your Brain</label>
        <input type="checkbox" value="Mind Checkup">
        <label>Mind Checkup</label>
    </div>
    <input type="number" value="donazione">
    <input type="button" value="DONA">
    <a>Disiscriviti</a>
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere aderenti per poter accedere a questa pagina</label>
    <% } %>
</div>
<jsp:include page="footer.jsp"/>