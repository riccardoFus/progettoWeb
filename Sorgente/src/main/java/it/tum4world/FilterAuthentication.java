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
        HttpServletResponse hresp = (HttpServletResponse) servletResponse;
        boolean redirectUnauth = false;

        HttpSession session = hreq.getSession(false);
        String typeOfUser = null;
        String URI = hreq.getRequestURL().toString();
        String redirectUrl = "AccessoNonAutorizzato.jsp";

        if (session != null && session.getAttribute("typeOfUser") != null) {
            //prendi type of user dalla sessione
            typeOfUser = (String) session.getAttribute("typeOfUser");
        }
        if (typeOfUser == null) {
            //se utente non è loggato
            servletRequest.setAttribute("tipo", "standard");
            //se sta accedendo ad una pagina privata fai redirect
            redirectUnauth = URI.contains("AreaPersonale");

        } else {
            //è loggato
            servletRequest.setAttribute("tipo", typeOfUser);
            //può accedere alla pagina solo se è la SUA area privata, altrimenti redirect alla pagina di errore
            if (URI.contains("AreaPersonale")) {
                if ((!URI.toLowerCase().contains(typeOfUser) && !typeOfUser.equals("simpatizzante")) || (typeOfUser.equals("simpatizzante") && !URI.contains("Sim")))
                    redirectUnauth = true;
            }

        }

        if (redirectUnauth) {
            hresp.sendRedirect(hresp.encodeURL(redirectUrl));
            return;
        }


        filterChain.doFilter(servletRequest, servletResponse);
    }

}
