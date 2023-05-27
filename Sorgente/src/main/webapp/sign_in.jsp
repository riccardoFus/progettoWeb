<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<div class="flex-container" id="container-main">
        <form method="post" action="<%= response.encodeURL("signIn")%>" onsubmit="return validate()" id="form">
            <div class="row">
                <label>Nome</label>
                <input type="text" name="nome" class="textbox">
                <span id="warnNome" class="warn"></span>

            </div>

            <div class="row">
                <label>Cognome</label>
                <input type="text" name="cognome" class="textbox">
                <span id="warnCogn" class="warn"></span>
            </div>

            <div class="row">
                <label>Data di nascita</label>
                <input type="date" name="data di nascita" class="textbox">
                <span id="warnData" class="warn"></span>

            </div>

            <div class="row">
                <label>Indirizzo email</label>
                <input type="text" name="email" class="textbox">
                <span id="warnEmail" class="warn"></span>

            </div>

            <div class="row">
                <label>Numero tel</label>
                <input type="tel" name="telefono" class="textbox">
                <span id="warnTel" class="warn"></span>

            </div>

            <div class="row">
                <label>Sottoscrizione</label>
                <input type="radio" name="sottoscriz" value="simpatizzante" id="simp">
                <label for="simp">Simpatizzante</label>
                <input type="radio" name="sottoscriz" value="aderente" id="ader">
                <label for="ader">Aderente</label>
                <span id="warnSott" class="warn"></span>

            </div>

            <div class="row">
                <label>Username</label>
                <input type="text" name="username" class="textbox">
                <span id="warnUser" class="warn"></span>

            </div>

            <div class="row">
                <label>Password</label>
                <input type="password" name="psw" class="textbox">
                <span id="warnPsw" class="warn"></span>

            </div>

            <div class="row">
                <label>Conferma password</label>
                <input type="password" name="psw confermata" class="textbox">
                <span id="warnPswConf" class="warn"></span>

            </div>

            <div class="flex-container">
                <input type="submit" value="Sign in" class="button">
                <input type="button" onclick="reset()" value="Reset" class="button">
            </div>

        </form>
</div>

<script type="text/javascript" src="./javascript/validationSignIn.js"></script>
<jsp:include page="footer.jsp"/>