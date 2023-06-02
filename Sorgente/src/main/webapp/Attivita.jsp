<jsp:include page="header.jsp"/>

<div class="column" id="col1">
    <h2>WATER WEEK</h2>
    <h3>idroterapia</h3>
    <div class="row">
        <a href="<%= response.encodeURL("./WaterWeek.jsp")%>"><img src="images/aquagym.jpg" alt="aquagym"></a>
        <p>
            Noi di Tum4World, offriamo la possibilità ad anziani e disabili di beneficiare di corsi terapeutici nelle
            piscine che li aiuteranno a mantenere la loro mobilità e a rilassarsi in compagnia
        </p>
    </div>
</div>

<div class="column" id="col2">
    <h2>FEED YOUR BRAIN</h2>
    <h3>divertiti in compagnia</h3>

    <div class="row">
        <div class="column">
            <p>
                Non c'è nulla di meglio che una serie di giochi in scatola per ravvivare la giornata di tutti allenando
                allo stesso tempo il cervello
            </p>
            <p>
                Gli eventi che organizziamo sono mirati a riunire studenti, anziani e disabili per stimolare la nascita
                di nuovi rapporti e amicizie che li possano accompagnare nella vita quotidiana
            </p>

        </div>
        <a href="<%= response.encodeURL("./FeedYourBrain.jsp")%>"><img src="images/giochi_da_tavolo.jpg"
                                                                alt="giochi da tavolo"></a>
    </div>
</div>

<div class="column" id="col3">
    <h2>MIND CHECKUP</h2>
    <h3>trova l'aiuto di cui hai bisogno</h3>

    <div class="row">
        <a href="<%= response.encodeURL("./MindCheckUp.jsp")%>"><img src="images/psicologia.jpg"
                                                                           alt="supporto psicologico"></a>
        <p>
            È importante prendersi cura della propria salute mentale, ma spesso i programmi di supporto non sono
            disponibili a tutti e per questo offriamo un servizio che rende più facile consultare psicologi, ottenere i
            medicinali prescritti e aprirsi ai propri pari
        </p>

    </div>
</div>

<jsp:include page="footer.jsp"/>