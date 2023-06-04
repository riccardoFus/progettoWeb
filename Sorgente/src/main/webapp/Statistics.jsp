<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="flex-container">
    <label id="text1" style="display:none">Visualizzazioni totali del sito: </label>
    <label id="views"> </label>
        <br>




    <input type="submit" class="button" value="Visite totali" onclick="showTotalViewers()">

</div>
<jsp:include page="footer.jsp"/>
<script src="./javascript/statistics.js"></script>