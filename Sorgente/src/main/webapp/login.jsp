<jsp:include page="header.jsp"></jsp:include>
    <div>
        <h1>Login</h1>
        <div class="divBottoni" align="center">
            <form>
                <div class="divBottoni">
                <b><label>Username</label></b>
                <input type="text" class="textbox" id="username" height="50px">
                </div>
                <br>

                <div class="divBottoni">
                    <b><label>Password</label></b>
                <input type="password" class="textbox" id="password">
                </div>

                <br>
                <input type="submit" value="Login" id="button" formaction="" align="center" onclick="return checkLogin(this.form)">
                <br>
            </form>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>