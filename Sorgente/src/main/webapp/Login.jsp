<jsp:include page="header.jsp"/>

<!-- Pagina di login alla parte privata -->
<div class="flex-container" id="login">
    <!-- onkeydown inserito per evitare che il form venga "submittato" quando si preme 'Enter' con la tastiera -->
    <form method="post" action="<%= response.encodeURL("./logIn")%>" onsubmit="return checkLogin(this)"
          onkeydown="return event.key != 'Enter';">
        <div class="column">
            <span id="warnNome" class="warn"></span>
            <div class="row">
                <label>Username</label>
                <input type="text" class="textbox" name="username" id="username">
            </div>
        </div>

        <div class="column">
            <span id="warnPsw" class="warn"></span>
            <div class="row">
                <label>Password</label>
                <input type="password" class="textbox" name="password">
            </div>
        </div>

        <div class="row" id="buttons">
            <input type="submit" value="Login" class="button">
        </div>
    </form>
</div>
<jsp:include page="consenso_cookie.jsp"/>
<jsp:include page="footer.jsp"/>
</div>

<script src="./javascript/validationLogin.js"></script>