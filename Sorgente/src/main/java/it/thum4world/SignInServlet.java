package it.thum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "signIn", value = "/signIn")
public class SignInServlet extends DBManager {
    @Override
    synchronized protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // riceve i dati del form di sign in
        String username = req.getParameter("username");
        String psw = req.getParameter("psw");
        //statement sql per creare un nuovo utente

        //alg sha-256 per password
        MessageDigest digest = null;
        String sha3Hex;
        try {
            digest = MessageDigest.getInstance("SHA3-256");
            final byte[] hashbytes = digest.digest(psw.getBytes(StandardCharsets.UTF_8));
            sha3Hex = bytesToHex(hashbytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        boolean aderente = req.getParameter("sottoscriz").equals("aderente");

        String updateUtenti = "INSERT INTO utenti VALUES ("+ username+","+ sha3Hex +"," + req.getParameter("email") + "); ";
        String updateClienti = "INSERT INTO clienti VALUES ("+ req.getParameter("nome")
                + ", " + req.getParameter("cognome") + ", " + req.getParameter("data di nascita") +
                ", " + req.getParameter("telefono") + ", " + aderente + ", " + username+ "); ";
        if(updateDB(updateUtenti) && updateDB(updateClienti)){
            //iscrizione andata a buon fine, redirect corretto
        }

    }

    private static String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if(hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}


