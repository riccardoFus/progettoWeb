<jsp:include page="header.jsp"/>
<div>
    <div>
        <h3>Dati personali</h3>
        <label>USERNAME</label>
        <p class="info"></p>
        <label>NOME</label>
        <p class="info"></p>
        <label>COGNOME</label>
        <p class="info"></p>
        <label>DATA DI NASCITA</label>
        <p class="info"></p>
        <label>NUMERO DI TELEFONO</label>
        <p class="info"></p>
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
    <a onclick="deleteAccount()">Disiscriviti</a>
</div>

<script src="./javascript/paginaPrivata.js"></script>
<jsp:include page="footer.jsp"/>