package it.tum4world;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class FilterAuthentication implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest hreq = (HttpServletRequest) servletRequest;
        HttpSession session = hreq.getSession(false);

        /* Prende la sessione e analizza i parametri: l'utente è loggato?*/

        if (session != null && session.getAttribute("username") != null) {
            //utente è loggato
            String typeOfUser = (String) session.getAttribute("typeOfUser");
            if (typeOfUser == null) {
                //pagina di errore
                servletRequest.setAttribute("tipo", "standard");

            } else {
                /* passa il parametro alle pagine per indicare il tipo di utente*/
                servletRequest.setAttribute("tipo", typeOfUser);
            }

        } else {
            //utente non è loggato
            servletRequest.setAttribute("tipo", "standard");
            //se è su una pagina privata redirect a login

            if(((HttpServletRequest) servletRequest).getRequestURI().contains("AreaPersonale")){
                HttpServletResponse hresp = (HttpServletResponse) servletResponse;
                String url = hresp.encodeURL("Login.jsp");
                hresp.sendRedirect(url);
                return;

            }

        }

        filterChain.doFilter(servletRequest, servletResponse);
    }
}
