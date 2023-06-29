package it.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InitServer", value = "/InitServer")
public class InitServer extends DBManager {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // servlet eseguita all'inizio del server
        // genera tutte le tabelle nel DB e popola la tabella inserendo l'admin e le frasi
        String initUtenti = "CREATE TABLE utenti(\n" +
                "    username VARCHAR(25) PRIMARY KEY,\n" +
                "    password CHAR(64) NOT NULL,\n" +
                "    email VARCHAR(50) NOT NULL\n" +
                ")";
        String initClienti = "CREATE TABLE clienti(\n" +
                "    nome VARCHAR(25) NOT NULL,\n" +
                "    cognome VARCHAR(25) NOT NULL,\n" +
                "    data_di_nascita DATE NOT NULL,\n" +
                "    telefono VARCHAR(15),\n" +
                "    aderente BOOLEAN NOT NULL,\n" +
                "    username VARCHAR(25),\n" +
                "    FOREIGN KEY (username) REFERENCES utenti(username)\n" +
                ")";
        String initAmministratori = "CREATE TABLE amministratori(\n" +
                "    username VARCHAR(25) NOT NULL,\n" +
                "    FOREIGN KEY (username) REFERENCES utenti(username)\n" +
                ")";
        String initFrasi = "CREATE TABLE frasi (id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (Start with 1, Increment by 1), contenuto VARCHAR(300) NOT NULL)";
        String initDonazioni = "CREATE TABLE donazioni(\n" +
                "    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),\n" +
                "    quota INTEGER NOT NULL,\n" +
                "    data DATE NOT NULL,\n" +
                "    username VARCHAR(25) NOT NULL,\n" +
                "    FOREIGN KEY (username) REFERENCES utenti(username)\n" +
                ")";
        String initIscrizioni = "CREATE TABLE iscrizioni(\n" +
                "    username VARCHAR(25) NOT NULL,\n" +
                "    waterWeek BOOLEAN NOT NULL,\n" +
                "    FeedYourBrain BOOLEAN NOT NULL,\n" +
                "    MindCheckup BOOLEAN NOT NULL,\n" +
                "    FOREIGN KEY (username) REFERENCES utenti(username)\n" +
                ")";
        String initVisite = "CREATE TABLE VISITE (page VARCHAR(50) NOT NULL PRIMARY KEY, visits INTEGER NOT NULL)";

        //esito diviso così se un tabella è già presente le altre possono essere create
        updateDB(initUtenti);
        updateDB(initAmministratori);
        updateDB(initClienti);
        updateDB(initFrasi);
        updateDB(initDonazioni);
        updateDB(initIscrizioni);
        updateDB(initVisite);

        String initQuotes = "INSERT INTO frasi (contenuto) VALUES ('La migliore preparazione per domani e'' fare il tuo meglio oggi.')";
        updateDB(initQuotes);
        initQuotes = "INSERT INTO frasi (contenuto) VALUES ('Cerco sempre di fare cio'' che non sono capace di fare, per imparare come farlo.')";
        updateDB(initQuotes);
        initQuotes = "INSERT INTO frasi (contenuto) VALUES ('Inizia da dove sei. Usa quello che hai. Fai quello che sei capace di fare.')";
        updateDB(initQuotes);
        initQuotes = "INSERT INTO frasi (contenuto) VALUES ('Esiste un''isola di opportunita'' in ogni difficoltà.')";
        updateDB(initQuotes);

        //inserisci admin se non presente

        String username = "admin";
        String psw = "07Adm1n!";
        String sha3Hex = createDigest(psw);
        String updateUtenti = "INSERT INTO utenti VALUES ('"+ username +"','"+ sha3Hex +"','" + "tum4world@nessunonoluogonoesiste.com" + "')";
        String updateAdmin = "INSERT INTO amministratori VALUES ('" + username+ "')";
        //controllo se l'admin non è già presente nel db
        if(updateDB(updateUtenti)){
            System.out.println("\nAdmin inserito\n");

            //carica nella tabella amministratori l'utente, fatto qui perché se lo metto nell'if, ogni volta mi aggiunge un istanza di admin nella tabella amministratori
            updateDB(updateAdmin);
        }else{
            System.out.println("\nAdmin già presente\n");
        }
        response.sendRedirect("Home.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
