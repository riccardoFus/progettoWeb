<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<div id="container-main" class="row" >
    <div class="flex-container">
        <form method="post" action="<%= response.encodeURL("./registrazione_confermata.jsp")%>" onsubmit="return validate()" id="form">
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
                <input type="radio" name="simp" value="simpatizzante" checked>
                <label>Simpatizzante</label>
                <input type="radio" name="ad" value="aderente">
                <label>Aderente</label>

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

            <div class="row">
                <input type="submit" value="Sign in" class="button">
                <input type="button" onclick="return reset()" value="Reset" class="button">
            </div>

        </form>
    </div>
</div>

<script type="text/javascript" src="./javascript/validationSignIn.js"></script>
<jsp:include page="footer.jsp"></jsp:include>