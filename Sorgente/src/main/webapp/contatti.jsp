<jsp:include page="header.jsp"></jsp:include>
  <div>
    <h1 align="center">CONTATTI</h1>
  </div>
  <div>
    <p>
      Indirizzo email della nostra associazione: <a href="mailto:tum4world@nessunonoluogonoesiste.com" target="_blank">tum4world@nessunonoluogonoesiste.com</a>
    </p>
  </div>

  <div>
    <p>Numero di telefono della nostra associazione: <b>+39 326 151242 1512154 1154</b></p></div>
  </div>

  <div id="form" align="center">
    <form action="invio_confermato.jsp" method="post">
      <div>
        <label for="name">Nome: </label>
        <input type="text" name="name" id="name" class="textbox"><br>
      </div>

      <br>
      <div>
        <label for="name">Cognome: </label>
        <input type="text" name="surname" id="surname" class="textbox"><br>
      </div>

      <br>
      <div>
        <label for="name">Email: </label>
        <input type="text" name="email" id="email" class="textbox"><br>
      </div>

      <br>
      <div>
        <label for="reasons">Motivazione: </label>
        <select name="reasons" id="reasons" class="textbox">
          <option value="info">Informazioni aggiuntive sui nostri servizi</option>
          <option value="richiesta">Richiesta di uno specifico servizio</option>
          <option value="inserimento">Vuoi entrare a far parte del nostro team</option>
          <option value="altro">Altro</option>
        </select><br>
      </div>

      <br>
      <div>
        <label for="altro">Aggiungi dettagli alla richiesta:</label><br><br>
        <textarea name="altro" id="altro" cols="100" rows="15"></textarea><br>
      </div>

      <br>
      <div>
        <input type="button" value="Submit" name="fakeSubmit" id="button" onclick="if(validatePageContatti(this.form)) document.getElementById('submit').click()">
        <input type="submit" id="submit" hidden>
        <input type="reset" value="Reset" name="reset" id="button">
      </div>

      <br>
    </form>
  </div>
<jsp:include page="footer.jsp"></jsp:include>