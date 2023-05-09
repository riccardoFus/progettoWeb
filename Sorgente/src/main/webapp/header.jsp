<header>
    <div>
        <h1>Tum4World</h1>
        <ul>
            <li><a href="homepage.jsp">Homepage</a></li>
            <li><a href="chisiamo.jsp">Chi siamo</a></li>
            <li><a href="attivita_generale.jsp">Attività</a></li>
            <li><a href="contatti.jsp">Contatti</a></li>
            <li><a href="sign-in.jsp">Sign-in</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </div>
    <div>
        <jsp:useBean id="phraseBean" class="it.thum4world.PhraseBean" scope="application"/>
        <p>Frase ispirante: <span><%= phraseBean.toString() %></span></p>
    </div>
</header>