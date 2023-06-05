<jsp:include page="header.jsp"/>
<div>
    <%
        session = request.getSession();
        if (session.getAttribute("userType")=="admin") {

    %>
    //Obv da aggiungere cose

    <input type="button" class= "button" value="Statistiche" onclick="redirectToStatistics()">
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere amministratori per poter accedere a questa pagina</label>
    <% }%>
</div>
<jsp:include page="footer.jsp"/>
<script src="./javascript/privatePageAdmin.js"></script>