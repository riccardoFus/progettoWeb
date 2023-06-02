<jsp:include page="header.jsp"/>

<h1>Login</h1>
<div class="divBottoni">
    <form method="post" action="<%= response.encodeURL("./logIn")%>" onsubmit="return checkLogin(this.form)" id="form">
        <div class="divBottoni">
            <label>Username</label>
            <input type="text" class="textbox" name="username" height="50px">
        </div>
        <br>
        <div class="divBottoni">
            <b><label>Password</label></b>
            <input type="password" class="textbox" name="password">
        </div>

        <br>
        <input type="submit" value="Login" class="button" onclick="return checkLogin()">
        <br>
    </form>
</div>

<script src="./javascript/validationLogin.js"></script>
<jsp:include page="footer.jsp"/>