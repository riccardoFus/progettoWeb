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
    }%>

</head>

<body>
<header id="header">
    <div id="nav">
        <h1>Tum4World</h1>
        <a href="<%= response.encodeURL("Home.jsp")%>">Homepage</a>
        <a href="<%=response.encodeURL("ChiSiamo.jsp")%>">Chi siamo</a>
        <a href="<%=response.encodeURL("Attivita.jsp")%>">Attività</a>
        <a href="<%=response.encodeURL("Contatti.jsp")%>">Contatti</a>

        <!-- controlla che tipo di utente è e decide di aggiungere o meno sign in, log out, log in,
        pagina privata nell'header-->
        <%
            session = request.getSession(false);
            System.out.println("USERTYPE HEADER:: " + session.getAttribute("typeOfUser"));
            String tipo = (String) session.getAttribute("typeOfUser");
            if (tipo==null) {
                //l'utente non è loggato
        %>

        <a href="<%=response.encodeURL("SignIn.jsp")%>">Sign-In</a>
        <a href="<%=response.encodeURL("Login.jsp")%>">Login</a>

        <%
        } else if (tipo.equals("aderente")) {
        %>
        <a href="<%=response.encodeURL("AreaPersonaleAderente.jsp")%>">Area personale</a>
        <a href="<%=response.encodeURL("Home.jsp")%>" onclick="return logOut()">Logout</a>

        <%
        } else if (tipo.equals("simpatizzante")) {
        %>
        <a href="<%=response.encodeURL("AreaPersonaleSim.jsp")%>">Area personale</a>
        <a href="<%=response.encodeURL("Home.jsp")%>">Logout</a>

        <%
        } else{
        %>
        <a href="<%=response.encodeURL("AreaPersonaleAdmin.jsp")%>">Area Personale</a>
        <a href="<%=response.encodeURL("Home.jsp")%>">Logout</a>
        <%}%>

    </div>
    <div id="phraseHeader"></div>
</header>

<script src="./javascript/headerScript.js"></script>