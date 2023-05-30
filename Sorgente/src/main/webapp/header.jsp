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
    <% }else if(pagina.contains("homepage.jsp")){%>
    <link rel="stylesheet" href="css/home_style.css" type="text/css">
    <% }%>
</head>

<body>
<header id="header" >
    <h1>Tum4World</h1>
    <div>
        <a href="<%= response.encodeURL("homepage.jsp")%>">Homepage</a>
        <a href="<%=response.encodeURL("chisiamo.jsp")%>">Chi siamo</a>
        <a href="<%=response.encodeURL("attivita_generale.jsp")%>">Attività</a>
        <a href="<%=response.encodeURL("contatti.jsp")%>">Contatti</a>
        <a href="<%=response.encodeURL("sign_in.jsp")%>">Sign-In</a>
        <a href="<%=response.encodeURL("login.jsp")%>">Login</a>

    </div>

    <!--
    <div>
        <!jsp:useBean id="phraseBean" class="it.tum4world.PhraseBean" scope="application"/>
        <p>Frase ispirante: <span><!%= phraseBean.toString() %></span></p>
    </div>
    -->

</header>