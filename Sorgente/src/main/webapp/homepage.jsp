<%--
  Created by IntelliJ IDEA.
  User: fusyr
  Date: 07/05/2023
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<html>
    <head>
        <title></title>
    </head>
    <body>
        HEADER SILVANUS
        <div>
            <p>
                Tum4World è un'associazione di volontariato che si dedica a sostenere e migliorare la vita degli anziani, dei disabili e degli
                studenti universitari, fornendo supporto e risorse per aiutare queste persone a raggiungere i propri obiettivi e migliorare
                la loro qualità di vita.
                <%-- AGGIUNGI IMMAGINE LOGO CON FIGURE--%>
            </p>
        </div>
        <div>
            <figure>
                <img src="images/associazione-regole.jpg" alt="Immagine Home Page">
                <figcaption>Immagine rappresentativa della nostra associazione (DA MODIFICARE EVENTUALMENTE)</figcaption>
            </figure>
        </div>
        <div>
            <a href="" download="VolantinoTum4World">
                <button type="button" disabled>Scarica volantino</button>
            </a>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
