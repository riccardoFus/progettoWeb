<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tum4World</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Major+Mono+Display">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Mono">
    <link rel="icon" href="images/favicon.png">

    <!-- gestione dei diversi file css da includere-->
    <%
        String[] URI = (request.getRequestURL().toString()).split("/");
        String pagina = URI[URI.length - 1];

        // questi if sono stati inseriti perchè in certe pagine sono presenti css aggiuntivi
        // per evitare di mettere il css in ogni pagina, abbiamo fatto questo check in base alle pagine
        if (pagina.contains("Attivita")) {%>
    <link rel="stylesheet" href="css/attivita_style.css" type="text/css">
    <% } else if (pagina.contains("WaterWeek")
            || pagina.contains("FeedYourBrain") || pagina.contains("MindCheckUp")) {%>
    <link rel="stylesheet" href="css/attivita_style.css" type="text/css">
    <link rel="stylesheet" href="css/attivitaSpec_style.css" type="text/css">
    <% } else if (pagina.contains("SignIn") || pagina.contains("AreaPersonale")
            || pagina.contains("Contatti") || pagina.contains("Login")) {%>
    <link rel="stylesheet" href="css/formPages_style.css" type="text/css">
    <% } else {%>
    <link rel="stylesheet" href="css/basicPage_style.css" type="text/css">
    <% if (pagina.contains("ChiSiamo")) {%>
    <link rel="stylesheet" href="css/styleSlider.css" type="text/css">
    <% }
    }
        //per la grafica
        // cambio di css in base al tipo di user
        //array url per il menu
        String[] urls = {"Home.jsp", "ChiSiamo.jsp", "Attivita.jsp", "Contatti.jsp", "SignIn.jsp", "Login.jsp", "AreaPersonaleAderente.jsp",
                "AreaPersonaleSim.jsp", "AreaPersonaleAdmin.jsp"};

        String tipo = request.getAttribute("tipo").toString();
        if (tipo.equals("standard")) {%>

    <link rel="stylesheet" href="css/standard_style.css" type="text/css">
    <%
    } else if (tipo.equals("aderente")) {
    %>
    <link rel="stylesheet" href="css/aderente_style.css" type="text/css">

    <%
    } else if (tipo.equals("simpatizzante")) {

    %>
    <link rel="stylesheet" href="css/simp_style.css" type="text/css">

    <%
    } else {
    %>
    <link rel="stylesheet" href="css/admin_style.css" type="text/css">
    <%
        }
    %>

</head>

<body>
<div id="wrap">
    <header id="header">
        <div id="nav">
            <h1>Tum4World</h1>
            <a class="linkHeader" href="<%= response.encodeURL(urls[0])%>">Homepage</a>
            <a class="linkHeader" href="<%= response.encodeURL(urls[1])%>">Chi siamo</a>
            <a class="linkHeader" href="<%=response.encodeURL(urls[2])%>">Attività</a>
            <a class="linkHeader" href="<%=response.encodeURL(urls[3])%>">Contatti</a>

            <!-- in base al tipo di utente inserisce l'header privato (con area personale e logout) oppure l'header pubblico (con signin e login) -->
            <%
                if (tipo.equals("standard")) {
                    //l'utente non è loggato, quindi mostro l'header con sign in e login
            %>

            <a class="linkHeader" href="<%=response.encodeURL(urls[4])%>">Sign-In</a>
            <a class="linkHeader" href="<%=response.encodeURL(urls[5])%>">Login</a>

            <%
                // in base al tipo di utente, mostriamo la rispettiva pagina personale
            } else if (tipo.equals("aderente")) {
            %>
            <a class="linkHeader" href="<%=response.encodeURL(urls[6])%>">Area personale</a>

            <%
            } else if (tipo.equals("simpatizzante")) {
            %>
            <a class="linkHeader" href="<%=response.encodeURL(urls[7])%>">Area personale</a>

            <%
            } else {
            %>
            <a class="linkHeader" href="<%=response.encodeURL(urls[8])%>">Area Personale</a>

            <%}%>
            <%
                if (!tipo.equals("standard")) {
            %>
            <a class="linkHeader" href="<%=urls[0]%>" onclick="logout(this)">Logout</a>
            <%
            }%>

        </div>
        <!-- Div contenente le frasi generate casualmente -->
        <div id="phraseHeader"></div>
        <script src="./javascript/headerScript.js"></script>
    </header>