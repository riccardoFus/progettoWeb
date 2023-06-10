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
        session = request.getSession(false);
        String tipo = (String) session.getAttribute("typeOfUser");
        if (tipo == null) {%>

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
            <a class="linkHeader" href="<%= response.encodeURL("Home.jsp")%>">Homepage</a>
            <a class="linkHeader" href="<%=response.encodeURL("ChiSiamo.jsp")%>">Chi siamo</a>
            <a class="linkHeader" href="<%=response.encodeURL("Attivita.jsp")%>">Attività</a>
            <a class="linkHeader" href="<%=response.encodeURL("Contatti.jsp")%>">Contatti</a>

            <!-- controlla che tipo di utente è e decide di aggiungere o meno sign in, log out, log in,
            pagina privata nell'header-->
            <%
                if (tipo == null) {
                    //l'utente non è loggato
            %>

            <a class="linkHeader" href="<%=response.encodeURL("SignIn.jsp")%>">Sign-In</a>
            <a class="linkHeader" href="<%=response.encodeURL("Login.jsp")%>">Login</a>

            <%
            } else if (tipo.equals("aderente")) {
            %>
            <a class="linkHeader" href="<%=response.encodeURL("AreaPersonaleAderente.jsp")%>">Area personale</a>
            <a class="linkHeader" href="<%=response.encodeURL("Home.jsp")%>" onclick="logout(this)">Logout</a>

            <%
            } else if (tipo.equals("simpatizzante")) {
            %>
            <a class="linkHeader" href="<%=response.encodeURL("AreaPersonaleSim.jsp")%>">Area personale</a>
            <a class="linkHeader" href="<%=response.encodeURL("Home.jsp")%>" onclick="logout(this)">Logout</a>

            <%
            } else {
            %>
            <a class="linkHeader" href="<%=response.encodeURL("AreaPersonaleAdmin.jsp")%>">Area Personale</a>
            <a class="linkHeader" href="<%=response.encodeURL("Home.jsp")%>" onclick="logout(this)">Logout</a>
            <%}%>

        </div>
        <div id="phraseHeader"></div>
    </header>

    <script src="./javascript/headerScript.js"></script>