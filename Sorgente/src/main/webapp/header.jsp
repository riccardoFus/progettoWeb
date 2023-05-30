<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tum4World</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Major+Mono+Display">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Mono">

    <!-- gestione dei diversi file css da includere-->
    <%
        String[] URI = (request.getRequestURI()).split("/");
        String pagina = URI[URI.length-1];
        if(pagina.contains("sign_in.jsp")){
    %>
    <link rel="stylesheet" href="css/signIn_style.css" type="text/css">
    <% }else if(pagina.contains("chisiamo.jsp")){%>
    <link rel="stylesheet" href="css/styleSlider.css" type="text/css">
    <% }else if(pagina.contains("attivita_generale.jsp")){%>
    <link rel="stylesheet" href="css/attivita_style.css" type="text/css">
    <%}%>
</head>

<body>
<header id="header" >
    <div>
        <h1 style="font-family:Papyrus">Tum4World</h1>
        <div class="divBottoni">
            <a class="button" href="<%= response.encodeURL("homepage.jsp")%>">Homepage</a>
            <a class="button" href="<%=response.encodeURL("chisiamo.jsp")%>">Chi siamo</a>
            <a class="button" href="<%=response.encodeURL("attivita_generale.jsp")%>">Attività</a>
            <a class="button" href="<%=response.encodeURL("contatti.jsp")%>">Contatti</a>
            <a class="button" href="<%=response.encodeURL("sign_in.jsp")%>">Sign-In</a>
            <a class="button" href="<%=response.encodeURL("login.jsp")%>">Login</a>
            <!--
                add-logout mechanism
                <a class="button" href="< % response.encodeurl(homepage.jsp) % >" >Logout</a>
                -->
        </div>
    </div>
    <script>
        // Aggiorna la frase nell'intestazione delle pagine ogni 20 secondi
        function updatePhrase() {
            let jsonObject;
            let URL = window.location.origin + '/' + window.location.pathname.split('/')[1] + '/PhraseFetcher';

            let xhttp = new XMLHttpRequest();

            xhttp.open("GET", URL, true);
            xhttp.responseType = "json";

            xhttp.onreadystatechange = function () {
                let done = 4, ok = 200;
                if (this.readyState === done && this.status === ok){
                    jsonObject = this.response;

                    document.getElementById("phraseHeader").innerText =
                        jsonObject.frase;
                }
            };

            xhttp.send();
        }

        updatePhrase();
        window.setInterval(updatePhrase, 20000);
    </script>
    <div>
        <span>Frase ispirante: "<span id="phraseHeader"></span>"</span>
    </div>
</header>