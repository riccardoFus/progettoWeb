package it.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet(name = "logIn", value = "/logIn")
public class logInServlet extends DBManager {
    @Override
    synchronized protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // riceve i dati del form di login
        String username = req.getParameter("username");
        /* applichiamo l'algoritmo SHA-256 e memorizziamo il digest? * */
        String password = req.getParameter("password");
        MessageDigest digest;
        String sha3Hex;

        try {
            //Uguale al sign in
            digest = MessageDigest.getInstance("SHA3-256");
            final byte[] hashbytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            sha3Hex = bytesToHex(hashbytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        System.out.println("\nTrattamento dati login ...\n");

        if (username.length() == 0 || password.length() == 0) {
            System.out.println("Dati mancanti!");
        } else {
            String checkUtente = "SELECT * FROM UTENTI WHERE USERNAME='" + username + "'AND PASSWORD='" + sha3Hex + "'";
            String checkEmail = "SELECT * FROM UTENTI WHERE EMAIL='" + username + "'AND PASSWORD='" + sha3Hex + "'";
            //Ricevo i risultati delle due query
            ResultSet user = getInfoDB(checkUtente);
            ResultSet email = getInfoDB(checkEmail);

            try {
                //Se una delle due riceve duna riga, allora il login è valido
                if (user.next() == true || email.next() == true) {

                    System.out.println("\nLogin avvenuto!\n");
                } else {
                    System.out.println("\nErrore: login fallito\n");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
