<jsp:include page="header.jsp"></jsp:include>
  <div>
    <p>
      Indirizzo mail della nostra associazione: <a href="mailto:tum4world@nessunonoluogonoesiste.com" target="_blank">tum4world@nessunonoluogonoesiste.com</a>
    </p>
  </div>
  <div>
    <p>Numero di telefono della nostra associazione: +39 326 151242 1512154 1154</p>
  </div>
  <div id="form">
    <form action="SendFakeEmail" method="post">
      <label for="name">Inserisci nome: </label>
      <input type="text" name="name" id="name" style="position: absolute"><br>
      <label for="name">Inserisci cognome: </label>
      <input type="text" name="surname" id="surname"><br>
      <label for="name">Inserisci email: </label>
      <input type="text" name="email" id="email"><br>
      <label for="reasons">Inserisci motivazione: </label>
      <select name="reasons" id="reasons">
        <option value="info">Informazioni aggiuntive sui nostri servizi</option>
        <option value="richiesta">Richiesta di uno specifico servizio</option>
        <option value="inserimento">Vuoi entrare a far parte del nostro team</option>
        <option value="altro">Altro</option>
      </select><br>
      <textarea name="altro" id="altro" cols="100" rows="15"></textarea><br>
      <input type="button" value="Invia dati" name="fakeSubmit" id="fakeSubmit" onclick="if(validatePageContatti(this.form)) document.getElementById('submit').click()">
      <input type="submit" id="submit" hidden>
      <input type="reset" value="Resetta i campi di compilazione" name="reset" id="reset">
    </form>
  </div>
<jsp:include page="footer.jsp"></jsp:include>