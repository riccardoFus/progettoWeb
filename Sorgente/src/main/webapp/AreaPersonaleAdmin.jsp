<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="flex-container" id="areaP">
    <%
        session = request.getSession();
        if (session.getAttribute("typeOfUser") == "admin") {

    %>

    <div class="row">
        <input type="submit" class="button" value="Visite" onclick="showTotalViewers()">
        <input type="submit" class="button" value="Reset" onclick="resetValues()">
    </div>

    <div class="row">
        <label id="text"> </label>
        <label id="views"> </label>
    </div>

    <div class="row">
        <input type="submit" class="button" value="Iscritti" onclick="showTotalSubscriptions()">
        <input type="submit" class="button" value="Aderenti" onclick="showAderenteSubscriptions()">
        <input type="submit" class="button" value="Simpatizzanti" onclick="showSimpatizzanteSubscriptions()">
    </div>
        <table id="showUsers"></table>

    <div class="row">
        <input type="submit" class="button" value="Grafico Donazioni" onclick="showIstogrammaDonazioni()">
        <input type="submit" class="button" value="Grafico Visite" onclick="showIstogrammaVisite()">
    </div>
    <div id="divContGrafico">
        <div id="divGrafico"></div>
    </div>
    <%
    } else {

    %>
    <label id="text1">Siamo spiacenti, è necessario essere amministratori per poter accedere a questa pagina</label>
    <% }%>

</div>
<jsp:include page="footer.jsp"/>
</div>


<script src="./javascript/statistics.js"></script>
<script src="./javascript/highcharts.js"></script>
