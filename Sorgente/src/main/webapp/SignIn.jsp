<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<div class="flex-container" id="signin">
    <form method="post" action="<%= response.encodeURL("./signIn")%>" onsubmit="return validate()"
          onkeydown="return event.key != 'Enter';" id="form">
        <div class="column">
            <span id="warnNome" class="warn"></span>
            <div class="row">
                <label>Nome</label>
                <input type="text" name="nome" class="textbox">
            </div>
        </div>

        <div class="column">
            <span id="warnCogn" class="warn"></span>
            <div class="row">
                <label>Cognome</label>
                <input type="text" name="cognome" class="textbox">
            </div>

        </div>

        <div class="column">
            <span id="warnData" class="warn"></span>
            <div class="row">
                <label>Data di nascita</label>
                <input type="date" name="data di nascita" class="textbox">
            </div>
        </div>

        <div class="column">
            <span id="warnEmail" class="warn"></span>
            <div class="row">
                <label>Indirizzo email</label>
                <input type="text" name="email" class="textbox">
            </div>

        </div>

        <div class="column">
            <span id="warnTel" class="warn"></span>
            <div class="row">
                <label>Numero di telefono</label>
                <input type="tel" name="telefono" class="textbox">
            </div>

        </div>

        <div class="column">
            <span id="warnSott" class="warn"></span>
            <div class="row">
                <label>Sottoscrizione</label>
                <input type="radio" name="sottoscriz" value="simpatizzante" id="simp">
                <label for="simp">Simpatizzante</label>
                <input type="radio" name="sottoscriz" value="aderente" id="ader">
                <label for="ader">Aderente</label>

            </div>
        </div>

        <div class="column">
            <span id="warnUser" class="warn"></span>
            <div class="row">
                <label class="label">Username</label>
                <input type="text" name="username" class="textbox" id="username">
            </div>
        </div>

        <div class="column">
            <span id="warnPsw" class="warn"></span>
            <div class="row">
                <label class="label">Password</label>
                <input type="password" name="psw" class="textbox">
            </div>
        </div>

        <div class="column">
            <span id="warnPswConf" class="warn"></span>
            <div class="row">
                <label class="label">Conferma password</label>
                <input type="password" name="psw confermata" class="textbox">
            </div>

        </div>

        <div id="buttons" class="column">
            <input type="submit" value="Sign in" class="button">
        </div>

    </form>

    <input type="button" onclick="return reset()" class="button" value="Reset">
</div>

<script type="text/javascript" src="./javascript/validationSignIn.js"></script>
<jsp:include page="footer.jsp"/>