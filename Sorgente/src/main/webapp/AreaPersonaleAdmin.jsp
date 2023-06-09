<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <%
        session = request.getSession();
        if (session.getAttribute("userType")=="admin") {

    %>
    <br>
    <input type="submit" class="button" value="Visite" onclick="showTotalViewers()">
    <input type="submit" class="button" value="Reset" onclick="resetValues()">
    <label id="text1" style="display:none"> </label>
    <label id="views"> </label>
    <input type="submit" class="button" value="Iscritti" onclick="showTotalSubscriptions()">
    <input type="submit" class="button" value="Aderenti" onclick="showAderenteSubscriptions()">
    <input type="submit" class="button" value="Simpatizzanti" onclick="showSimpatizzanteSubscriptions()">
    <table id="showUsers"> </table>
    <input type="submit" class="button" value="Grafico Donazioni" onclick="showIstogrammaDonazioni()">
    <input type="submit" class="button" value="Grafico Visite" onclick="showIstogrammaVisite()">
    <div id="divGrafico" style="width:50%; height:400px;"></div>
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere amministratori per poter accedere a questa pagina</label>
    <% }%>

</div>
<jsp:include page="footer.jsp"/>
<script src="./javascript/statistics.js"></script>
<script src="./javascript/highcharts.js"></script>