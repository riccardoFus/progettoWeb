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
            String insertPage = "INSERT INTO visite VALUES ('"+ url +"', 0)";
            if(updateDB(insertPage)){
                System.out.println("OK");
            }else{
                System.out.println("URL già presente");
            }
            String updateVisit = "UPDATE visite SET visits = visits + 1 WHERE page = '"+url+"'";
            if(updateDB(updateVisit)){
                System.out.println("ok");
            }else{
                System.out.println("oh");
            }
        }else{

        }
        chain.doFilter(request, response);
    }
}
