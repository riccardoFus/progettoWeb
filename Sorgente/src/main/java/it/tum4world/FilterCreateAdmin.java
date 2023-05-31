package it.tum4world;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@WebFilter(filterName = "FilterCreateAdmin", urlPatterns = "/homepage.jsp", description = "Crea l'admin all'accensione del server")
public class FilterCreateAdmin extends DBManager implements Filter{
    public void init(FilterConfig config) throws ServletException {
        super.init();
    }

    public void destroy() {
        super.destroy();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("Ciao sono nel filter");
        String username = "admin";
        String psw = "07Adm1n!";
        String sha3Hex = createDigest(psw);

        String updateUtenti = "INSERT INTO utenti VALUES ('"+ username +"','"+ sha3Hex +"','" + "tum4world@nessunonoluogonoesiste.com" + "')";
        String updateAdmin = "INSERT INTO amministratori VALUES ('" + username+ "')";
        //controllo se l'admin non è già presente nel db
        if(updateDB(updateUtenti)){
            System.out.println("Admin inserito");

            //carica nella tabella amministratori l'utente, fatto qui perché se lo metto nell'if, ogni volta mi aggiunge un istanza di admin nella tabella amministratori
            updateDB(updateAdmin);
        }else{
            System.out.println("\nAdmin già presente\n");
        }
        chain.doFilter(request, response);
    }
}
