package it.tum4world;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet(name = "logIn", value = "/logIn")
public class logInServlet extends DBManager {
    @Override
    synchronized protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        MessageDigest digest;
        String sha3Hex;

        System.out.println("\nTrattamento dati login ...\n");

        if (username.length() == 0 || password.length() == 0) {
            System.out.println("Dati mancanti!");

        } else {
            try {
                //Uguale al sign in
                digest = MessageDigest.getInstance("SHA3-256");
                final byte[] hashbytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                sha3Hex = bytesToHex(hashbytes);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }

            String checkUtente = "SELECT * FROM UTENTI WHERE USERNAME='" + username + "'AND PASSWORD='" + sha3Hex + "'";
            System.out.println(checkUtente);
            //Ricevo i risultati delle due query
            ResultSet user = getInfoDB(checkUtente);
            String response;

            try {
                //Se una delle due riceve una riga, allora il login è valido
                //TO_DO: in base al tipo di utente, andare alla determina pagina privata
                if (user.next() == true) {
                    response = "";
                } else {
                    response = "07: Login fallito!";
                    //Invia un errore alla richiesta
                }
                user.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");
            try(PrintWriter writer = resp.getWriter()){
                Gson gson = new Gson();
                writer.println(gson.toJson(response));
                writer.flush();
            }catch (IOException ex){
                //errore
                System.out.println("\nErrore: impossibile creare un json di risposta\n");
                System.out.println("\nDettagli:\n" + ex);
            }
        }

    }

    @Override
    synchronized protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        MessageDigest digest;
        String sha3Hex;

        System.out.println("\nTrattamento dati login ...\n");

        if (username.length() == 0 || password.length() == 0) {
            System.out.println("Dati mancanti!");

        } else {
            try {
                //Uguale al sign in
                digest = MessageDigest.getInstance("SHA3-256");
                final byte[] hashbytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                sha3Hex = bytesToHex(hashbytes);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }

            String checkUtente = "SELECT * FROM UTENTI WHERE USERNAME='" + username + "'AND PASSWORD='" + sha3Hex + "'";
            //Ricevo i risultati delle due query
            ResultSet user = getInfoDB(checkUtente);

            try {
                //Se una delle due riceve una riga, allora il login è valido
                //TO_DO: in base al tipo di utente, andare alla determina pagina privata
                if (user.next() == true) {
                    resp.sendRedirect(resp.encodeURL("private_page_aderente.jsp"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
