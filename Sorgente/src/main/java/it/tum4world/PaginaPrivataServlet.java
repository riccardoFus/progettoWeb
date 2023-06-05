package it.tum4world;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "paginaPrivata", value = "/paginaPrivata")
public class PaginaPrivataServlet extends DBManager {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //getbody
        BufferedReader br = req.getReader();
        StringBuilder response = new StringBuilder();
        String responseLine = null;
        while ((responseLine = br.readLine()) != null) {
            response.append(responseLine.trim());
        }

        //response contiene ora un oggetto JSON in stringa
        //convertiamolo in oggeto json
        JsonObject json = new Gson().fromJson(response.toString(), JsonObject.class);

        String tipoOp = json.get("operazione").getAsString();
        HttpSession session = req.getSession(false);
        String username = (String) session.getAttribute("username");

        if (tipoOp.equals("subUnsub")) {
            String campo = json.get("campo").getAsString();
            boolean val = false;
            if (json.get("nuovoVal").getAsString().equals("true"))
                val = true;

            String query = "UPDATE iscrizioni SET " + campo + "=" + val + " WHERE username='" + username + "'";

            if (updateDB(query)) {
                //nessun problema
                try (PrintWriter writer = resp.getWriter()) {
                    writer.println("{ \"msg\":\"operazione riuscita\"}");
                    writer.flush();

                } catch (IOException ex) {
                    //errore
                    System.out.println("\nErrore: impossibile creare un json di risposta\n");
                    System.out.println("\nDettagli:\n" + ex);
                }
            }
        } else {
            //QUERY PER RIMOZIONE
            //1.rimozione da clienti o amministratori

            String msg; //contiene il messaggio di risposta
            String typeUser = (String) session.getAttribute("typeOfUser");
            String query;
            if(typeUser.equals("admin")){
                //user è amministratore
                query = "DELETE FROM amministratori WHERE username='" + username + "'";
            }else
                query = "DELETE FROM clienti WHERE username='" + username + "'";

            boolean esito = updateDB(query);
            //2.rimozione da utenti
            query = "DELETE FROM utenti WHERE username='" + username + "'";
            esito = esito && updateDB(query);

            //3.rimozione iscrizioni
            query = "DELETE FROM iscrizioni WHERE username='" + username + "'";
            esito = esito && updateDB(query);

            //4.rimozione delle donazioni nel caso l'utente sia aderente
            if(typeUser.equals("aderente")){
                query = "DELETE FROM donazioni WHERE username='" + username + "'";
                esito = esito && updateDB(query);
            }

            if(!esito)
                msg="Errore: qualcosa è andato storto";
            else
                msg="Iscrizione rimossa con successo";

            //invalida sessione attiva
            session.invalidate();

            //ritorna
            //N.B: il filter si occuperà di buttare fuori l'utente se la sessione non è attiva
            try (PrintWriter writer = resp.getWriter()) {
                writer.println("{ \"msg\":\"" + msg + "\"}");
                writer.flush();

            } catch (IOException ex) {
                //errore
                System.out.println("\nErrore: impossibile creare un json di risposta\n");
                System.out.println("\nDettagli:\n" + ex);
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //riceve le richieste per visualizzare i dati dell'utente comprese le informazioni sulle iscrizioni

        HttpSession session = req.getSession(false);
        String username = (String) session.getAttribute("username");
        String query = "SELECT nome, cognome, data_di_nascita, telefono, aderente, clienti.username, waterweek, feedyourbrain, mindcheckup" +
                " FROM clienti JOIN iscrizioni ON clienti.username = iscrizioni.username WHERE clienti.username='" + username + "'";
        ResultSet result = getInfoDB(query);
        Clienti cliente = null;
        try {
            if (result.next()) {
                String nome = result.getString("nome");
                String cognome = result.getString("cognome");
                Date data = result.getDate("data_di_nascita");
                String tel = result.getString("telefono");
                String usernameInfo = result.getString("username");
                Boolean WW = result.getBoolean("waterweek");
                Boolean FYB = result.getBoolean("feedyourbrain");
                Boolean MC = result.getBoolean("mindcheckup");
                cliente = new Clienti(nome, cognome, data, tel, usernameInfo, WW, FYB, MC);
            }

        } catch (SQLException e) {
            System.out.println("Errore: risultato inaspettato durante il ritiro dei dati utente dal db\n");
        }

        try (PrintWriter writer = resp.getWriter()) {
            Gson gson = new Gson();
            writer.println(gson.toJson(cliente));
            writer.flush();

        } catch (IOException ex) {
            //errore
            System.out.println("\nErrore: impossibile creare un json di risposta\n");
            System.out.println("\nDEttagli:\n" + ex);
        }

    }
}

class Clienti {
    String nome;
    String cognome;
    Date dataDiNascita;
    String numTel;
    String username;
    Boolean iscrizWW;
    Boolean iscrizFYB;
    Boolean iscrizMC;

    public Clienti(String nome, String cognome, Date dataDiNascita, String numTel, String username,
                   Boolean iscrizWW, Boolean iscrizFYB, Boolean iscrizMC) {
        this.nome = nome;
        this.cognome = cognome;
        this.dataDiNascita = dataDiNascita;
        this.numTel = numTel;
        this.username = username;
        this.iscrizWW = iscrizWW;
        this.iscrizFYB = iscrizFYB;
        this.iscrizMC = iscrizMC;
    }
}