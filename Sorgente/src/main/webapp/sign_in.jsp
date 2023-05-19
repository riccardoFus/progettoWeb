<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>

<div class="divBottoni">
    <form method="post" action="<%= response.encodeURL("./registrazione_confermata.jsp")%>" onsubmit="return validate()" id="form">
        <table>
            <tbody>
                <tr>
                    <th>Nome</th>
                    <td><input type="text" name="nome" class="textbox"> <span id="warnNome" class="warn"></span></td>
                </tr>


                <tr>
                    <th>Cognome</th>
                    <td><input type="text" name="cognome" class="textbox"> <span id="warnCogn" class="warn"></span></td>
                </tr>

                <tr>
                    <th>Data di nascita</th>
                    <td><input type="date" name="data di nascita" class="textbox"> <span id="warnData" class="warn"></span></td>
                </tr>

                <tr>
                    <th>Indirizzo email</th>
                    <td><input type="text" name="email" class="textbox"> <span id="warnEmail" class="warn"></span></td>
                </tr>

                <tr>
                    <th>Numero tel</th>
                    <td><input type="tel" name="telefono" class="textbox"> <span id="warnTel" class="warn"></span></td>
                </tr>

                <tr>
                    <th>Sottoscrizione</th>
                    <td>
                        <input type="radio" name="simp" value="simpatizzante" checked>
                        <label>Simpatizzante</label>
                        <input type="radio" name="ad" value="aderente">
                        <label>Aderente</label>
                    </td>
                </tr>

                <tr>
                    <th>Username</th>
                    <td><input type="text" name="username" class="textbox"> <span id="warnUser" class="warn"></span></td>
                </tr>

                <tr>
                    <th>Password</th>
                    <td><input type="password" name="psw" class="textbox"> <span id="warnPsw" class="warn"></span></td>
                </tr>

                <tr>
                    <th>Conferma password</th>
                    <td><input type="password" name="psw confermata" class="textbox"><span id="warnPswConf" class="warn"></span></td>
                </tr>
            </tbody>

        </table>

        <input type="submit" value="Sign in" class="button">
        <input type="button" onclick="return reset()" value="Reset" class="button">

    </form>
</div>

<script type="text/javascript" src="./javascript/validationSignIn.js"></script>
<jsp:include page="footer.jsp"></jsp:include>