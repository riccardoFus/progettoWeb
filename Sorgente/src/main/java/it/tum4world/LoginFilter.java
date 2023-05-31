package it.tum4world;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;

/*@WebFilter(filterName = "filterLogin", urlPatterns = "/*",
        description = "controlla se l'utente è loggato e che tipo di utente è")*/
public class LoginFilter implements Filter {

    public void init() {
    }
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

    }

    public void destroy() {
    }
}