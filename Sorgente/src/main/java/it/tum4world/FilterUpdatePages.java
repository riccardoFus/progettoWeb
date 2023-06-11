package it.tum4world;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class FilterUpdatePages extends DBManager implements Filter {
    public void init(FilterConfig config) throws ServletException {
        super.init();
    }

    public void destroy() {
        super.destroy();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        if(((HttpServletRequest)request).getRequestURI().split("/").length >= 3){
            String url = ((HttpServletRequest)request).getRequestURI().split("/")[2];
            // se la richiesta ha l'url rewriting, in questo modo lo rimuovo in modo tale da mettere la pagina corretta nel conteggio
            if(! url.endsWith(".jsp")) {
                url = url.split(";")[0];
            }
            // se la pagine non è presente nella tabella delle visite la aggiungo altrimenti non fa nulla, darà errore perché cercherà di scrivere un record con la stessa PK
            // tuttavia non dà problemi
            String insertPage = "INSERT INTO visite VALUES ('"+ url +"', 0)";
            updateDB(insertPage);
            // aumenta il counter della pagina visitata
            String updateVisit = "UPDATE visite SET visits = visits + 1 WHERE page = '"+url+"'";
            updateDB(updateVisit);
        }else{

        }
        chain.doFilter(request, response);
    }
}
