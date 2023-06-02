<jsp:include page="header.jsp"/>

<div class="flex-container" id="login">
    <form method="post" action="<%= response.encodeURL("./logIn")%>" onsubmit="return checkLogin(this)"
          onkeydown="return event.key != 'Enter';">
        <div class="column">
            <span id="warnNome" class="warn"></span>
            <div class="row">
                <label>Username</label>
                <input type="text" class="textbox" name="username">
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

<script src="./javascript/validationLogin.js"></script>
<jsp:include page="footer.jsp"/>