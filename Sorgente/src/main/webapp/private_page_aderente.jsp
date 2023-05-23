<!-- DA METTERE L'HEADER PRIVATO -->
<jsp:include page="header.jsp"></jsp:include>
<!--
     Per ogni pagina privata dobbiamo controllare la sessione/cookie di autenticazione
-->
<div>
  <form>
    <input type="submit" formaction="" value="Visualizza i dati personali"><br>
    <input type="submit" formaction="" value="Iscriviti alle attività dell'associazione"><br>
    <input type="submit" formaction="" value="Cancella l'iscrizione"><br>
    <input type="submit" formaction="" value="Effettua una donazione"><br>
  </form>
</div>
<!--
     Per ogni formaction in teoria si dovrebbe fare uno script/servlet che restituisce qualcosa, AJAJ perché
     dovrebbe essere una cosa responsive
-->
<jsp:include page="footer.jsp"></jsp:include>