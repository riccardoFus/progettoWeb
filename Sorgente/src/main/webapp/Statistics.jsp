<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="flex-container">
    <%
        session = request.getSession();

        if (session.getAttribute("userType")=="admin") {

    %>
    <label id="text1" style="display:none">Visualizzazioni totali del sito: </label>
    <label id="views"> </label>
    <br>




    <input type="submit" class="button" value="Visite" onclick="showTotalViewers()">
    <br>
    <input type="submit" class="button" value="Statistiche">
    <%
        } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere amministratori per poter accedere a questa pagina</label>
    <% } %>


</div>
<jsp:include page="footer.jsp"/>
<script src="./javascript/statistics.js"></script>