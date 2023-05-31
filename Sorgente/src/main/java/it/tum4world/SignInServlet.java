package it.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.Gson;

@WebServlet(name = "signIn", value = "/signIn")
public class SignInServlet extends DBManager {

    @Override
    synchronized protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // riceve i dati del form di sign in
        String username = req.getParameter("username");

        /* non memorizziamo la psw in chiaro, ma applichiamo l'algoritmo SHA-256 e memorizziamo il digest * */
        String psw = req.getParameter("psw");

        String sha3Hex = createDigest(psw);

        /* prendi la stringa del numero telefonico e convertilo in intero
        *  N.B: si accettano formati diversi (possono includere +, ., parentesi ...)*/

        String tel = req.getParameter("telefono");
        String telN = purifyNumber(tel);

        // N.B nel db aderente è un parametro booleano

        boolean aderente = req.getParameter("sottoscriz").equals("aderente");
        System.out.println("\nTrattamento dati signin ...\n");

        String updateUtenti = "INSERT INTO utenti VALUES ('"+ username+"','"+ sha3Hex +"','" + req.getParameter("email") + "')";
        String updateClienti = "INSERT INTO clienti VALUES ('"+ req.getParameter("nome")
                        + "', '" + req.getParameter("cognome") + "', '" + req.getParameter("data di nascita") +
                        "', '" + telN + "', " + aderente + ", '" + username+ "')";
        if(updateDB(updateUtenti) && updateDB(updateClienti)){
            //iscrizione andata a buon fine, redirect corretto
            req.getRequestDispatcher("./registrazione_confermata.jsp").forward(req,resp);

        }else{
            System.out.println("\nErrore: inserimento utente fallito\n");

        }

    }

    private String purifyNumber(String str){
        String purified = "";
        int lastIndex = 0;
        for(int i = 0; i <str.length(); i++){
            char c = str.charAt(i);
            if(c < '0' || c > '9'){
                //trovato un carattere speciale
                if(i > lastIndex){
                    purified = purified.concat(str.substring(lastIndex, i));
                }
                lastIndex = i + 1;
            }else if(i == str.length()-1){
                purified = purified.concat(str.substring(lastIndex, i+1));
            }

        }

        return purified;
    }

    /*
    per la verifica dell'username
    * */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String queryUsername = "SELECT username FROM utenti WHERE username='" + username + "'";
        ResultSet result = getInfoDB(queryUsername);
        //basta ritornare un valore booleano che indico se c'è o non c'è conflitto
        String usernameFound = "false";

        try {
            if(result.next()){
                usernameFound = "true";
            }
            result.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");
        try(PrintWriter writer = resp.getWriter()){
            Gson gson = new Gson();
            writer.println(gson.toJson(usernameFound));
            writer.flush();

        }catch (IOException ex){
            //errore
            System.out.println("\nErrore: impossibile creare un json di risposta\n");
            System.out.println("\nDEttagli:\n" + ex);
        }


    }
}


