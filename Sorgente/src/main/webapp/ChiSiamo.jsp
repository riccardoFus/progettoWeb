<jsp:include page="header.jsp"/>

<div id="content">

    <div id="left1" class = column>
        <h2>CHI SIAMO</h2>
        <p>
            Tum4World è un'organizzazione no-profit fondata nel 2023 da Riccardo Fusiello, Denise Comincioli, Silvanus
            Bordignon
            e Cesare Lever, quattro studenti dell'Università di Trento che hanno avuto un'idea “originalissima” durante
            il
            corso
            di Programmazione Web.
        </p>
    </div>

    <div id="right" class = column>
        <h2>COSA FACCIAMO</h2>
        <p>
            L'organizzazione si dedica a sostenere anziani, disabili e studenti universitari fornendo supporto e risorse
            per
            aiutare queste persone a raggiungere i propri obiettivi e migliorare la loro qualità di vita.
            Anche se è una realtà giovane, Tum4World è molto motivata e crede in ciò che fa, ma
            non ha ancora vinto premi se non un voto all'esame di Programmazione Web. I volontari di Tum4World sono
            impegnati a dedicare il proprio tempo,
            le proprie energie e le proprie risorse per realizzare gli obiettivi dell'organizzazione, condividendo una
            visione
            comune di un mondo in cui gli anziani, i disabili e gli studenti universitari hanno accesso a opportunità e
            risorse per una vita dignitosa e appagante.
        </p>
    </div>

    <div id="left2" class = column>
        <h2>DOVE CI PUOI TROVARE</h2>
        <p>
            La sede principale di Tum4World si trova a Napoli, ma l'organizzazione opera in diverse regioni italiane
            grazie
            all'aiuto dei suoi volontari.
        </p>

        <div class="carousel-container">
            <div class="images fade">
                <img src="images/aquagym.jpg" class="imageStandard">
            </div>
            <div class="images fade">
                <img src="images/giochi_da_tavolo.jpg" class="imageStandard">
            </div>
            <div class="images fade">
                <img src="images/psicologia.jpg" class="imageStandard">
            </div>
        </div>

        <!-- Navigation Dots-->
        <div style="text-align:center">
            <span class="navigation-dot" onclick="currentSlide(1)"></span>
            <span class="navigation-dot" onclick="currentSlide(2)"></span>
            <span class="navigation-dot" onclick="currentSlide(3)"></span>
        </div>
    </div>
</div>

<script src="javascript/scriptSlider.js"></script>
<jsp:include page="consenso_cookie.jsp"/>
<jsp:include page="footer.jsp"/>