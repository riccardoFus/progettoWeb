<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!-- gestione sessione
HttpSession session = request.getSession() -->
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tum4World</title>
    <link rel="stylesheet" href="css/styleSlider.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<header id="header" >
    <div>
        <h1>Tum4World</h1>
        <div class="divBottoni" align="center">
            <form>
                <input type="submit" value="Homepage" class="button" formaction="homepage.jsp">
                <input type="submit" value="Chi siamo" class="button" formaction="chisiamo.jsp">
                <input type="submit" value="Attività" class="button" formaction="attivita_generale.jsp">
                <input type="submit" value="Contatti" class="button" formaction="contatti.jsp">
                <!-- if(session.getAttribute("nome") == null)
                -->
                <input type="submit" value="Sign-In" class="button" formaction="sign_in.jsp">
                <!-- if(session.getAttribute("nome") == null) -->
                <input type="submit" value="Login" class="button" formaction="login.jsp">
                <!-- else
                add-logout mechanism
                <input type="button" value="Logout" class="button" formaction="< % response.encodeurl(homepage.jsp) % >" >
                -->
            </form>
        </div>
    </div>
    <!--
    <div>
        <!jsp:useBean id="phraseBean" class="it.thum4world.PhraseBean" scope="application"/>
        <p>Frase ispirante: <span><!%= phraseBean.toString() %></span></p>
    </div>
    -->

</header>