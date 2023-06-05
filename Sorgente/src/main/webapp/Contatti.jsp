<jsp:include page="header.jsp"/>
<div class="flex-container" id="contatti">
    <p>
        Indirizzo email della nostra associazione: <a href="mailto:tum4world@nessunonoluogonoesiste.com"
                                                      target="_blank">tum4world@nessunonoluogonoesiste.com</a>
    </p>

    <p>Numero di telefono della nostra associazione: +39 326 151242 1512154 1154</p>

    <form action="<%= response.encodeURL("./SendEmail")%>" method="post" onsubmit="return validatePageContatti(this)">

        <div class="column">
            <span id="warnNome" class="warn"></span>
            <div class="row">
                <label for="name">Nome</label>
                <input onkeydown="return event.key != 'Enter';" type="text" name="name" id="name" class="textbox">
            </div>

        </div>

        <div class="column">
            <span id="warnCognome" class="warn"></span>
            <div class="row">
                <label for="surname">Cognome</label>
                <input onkeydown="return event.key != 'Enter';" type="text" name="surname" id="surname" class="textbox">
            </div>

        </div>

        <div class="column">
            <span id="warnEmail" class="warn"></span>
            <div class="row">
                <label for="email">Email</label>
                <input onkeydown="return event.key != 'Enter';" type="text" name="email" id="email" class="textbox">
            </div>

        </div>


        <div class="row">
            <label for="reasons">Motivazione</label>
            <select onkeydown="return event.key != 'Enter';" name="reasons" id="reasons" class="textbox">
                <option value="info">informazioni aggiuntive sui nostri servizi</option>
                <option value="richiesta">richiesta di uno specifico servizio</option>
                <option value="inserimento">vuoi entrare a far parte del nostro team</option>
                <option value="altro">altro</option>
            </select>
        </div>

        <div class="column" id="altroDiv">
            <label for="altro">Aggiungi dettagli alla richiesta</label>
            <textarea name="altro" id="altro" cols="100" rows="15"></textarea>
        </div>

        <div id="buttons" class="column">
            <input type="submit" value="Submit" class="button">
        </div>

    </form>
    <input type="button" onclick="return reset()" class="button" value="Reset">

</div>

<script src="./javascript/validationContatti.js"></script>
<jsp:include page="consenso_cookie.jsp"/>
<jsp:include page="footer.jsp"/>