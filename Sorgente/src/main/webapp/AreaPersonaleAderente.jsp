<jsp:include page="header.jsp"/>
<script src="./javascript/paginaPrivata.js"></script>
<script>
    window.onload = setup('<%=response.encodeURL("paginaPrivata")%>')
</script>
<div class="flex-container" id="areaP">
    <div id="data">
        <!-- Bottone per mostrare i dati personali dell'aderente -->
        <button onclick="showInfo()" class="button">DATI PERSONALI</button>
    </div>

    <div class="column">
        <!-- Serie di bottoni per permettere all'aderente di iscriversi alle attività -->
        <h3>ISCRIVITI/DISISCRIVITI</h3>
        <div class="row">
            <label>Water Week</label>
            <!-- Se effettua click sul bottone si iscrive all'attività eseguendo subUnsub(this) -->
            <input type="checkbox" value="waterweek" onclick="subUnsub(this, '<%=response.encodeURL("paginaPrivata")%>')" class="iscriz">
        </div>

        <div class="row">
            <label>Feed Your Brain</label>
            <!-- Se effettua click sul bottone si iscrive all'attività eseguendo subUnsub(this) -->
            <input type="checkbox" value="feedyourbrain" onclick="subUnsub(this, '<%=response.encodeURL("paginaPrivata")%>')" class="iscriz">
        </div>

        <div class="row">
            <label>Mind Checkup</label>
            <!-- Se effettua click sul bottone si iscrive all'attività eseguendo subUnsub(this) -->
            <input type="checkbox" value="mindcheckup" onclick="subUnsub(this, '<%=response.encodeURL("paginaPrivata")%>')" class="iscriz">
        </div>

        <div class="column">
            <span id="warnDon" class="warn"></span>
            <div class="row">
                <input type="number" value="0" name="donazione" class="textbox">
                <!-- Spazio riservato alle donazioni (SOLO PER ADERENTE) -->
                <button onclick="donate('<%=response.encodeURL("paginaPrivata")%>')" class="button">Dona</button>
            </div>
        </div>
    </div>
    <!-- Bottone per permettere all'utente di disiscriversi dal sito, dopo aver eseguito la funzione js, viene reindirizzato all'homepage l'utente stesso-->
    <button onclick="deleteAccount('Home.jsp','<%=response.encodeURL("paginaPrivata")%>')" class="button">DISISCRIVITI</button>
</div>
<jsp:include page="footer.jsp"/>