<jsp:include page="header.jsp"></jsp:include>
    <div>
        <h1>Login</h1>
        <div class="divBottoni" align="center">
            <form method="post" action="<%= response.encodeURL("./logIn")%>" id="form">
                <div class="divBottoni">
                <b><label>Username</label></b>
                <input type="text" class="textbox" name="username" height="50px">
                </div>
                <br>
                <div class="divBottoni">
                    <b><label>Password</label></b>
                <input type="password" class="textbox" name="password">
                </div>

                <br>
                <input type="button" value="Login" class="button" onclick="if (checkLogin()) document.getElementById('fakeSubmit').click();" align="center">
                <input type="submit" id="fakeSubmit"  formmethod="post" hidden>
                <br>
                <div>  <h2><label class="label" id="labelError"> </label>  </h2> </div>
            </form>
        </div>
    </div>

<script src="javascript/validationLogin.js"></script>
<jsp:include page="footer.jsp"></jsp:include>