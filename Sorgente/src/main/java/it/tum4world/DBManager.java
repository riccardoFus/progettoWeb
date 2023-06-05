package it.tum4world;

import javax.servlet.http.HttpServlet;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class DBManager extends HttpServlet {

    protected Connection con = null;
    protected String URLDB= "jdbc:derby://localhost:1527/Tum4WorldDB";
    protected String user = "APP";
    protected String password = "admin";


    public void init(){

        //caricamento del driver jdbc
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("\nLoading ha avuto successo\n");
            con = DriverManager.getConnection(URLDB, user, password);
        } catch (ClassNotFoundException | NullPointerException | SQLException ex) {
            // errore nell caricamento del driver
            System.out.println("\nErrore: caricamento del driver jdbc fallito\n");
            System.out.println("\nDettagli:\n" + ex);
        }
    }

    @Override
    public void destroy() {
        try {
            con.close();
        } catch (SQLException e){
            System.out.println(e);
        }

    }

    public ResultSet getInfoDB(String query){
        ResultSet resultSet;

        try {
            // apri/riusa connessione
            Statement stmnt = con.createStatement();
            resultSet = stmnt.executeQuery(query);
        } catch (SQLException | NullPointerException e) {
            throw new RuntimeException(e);
        }

        return resultSet;
    }

    protected boolean updateDB(String update){
        try {
            System.out.println(update);
            Statement stmnt = con.createStatement();
            stmnt.executeUpdate(update);
            System.out.println("\nQuery SQL ha avuto successo\n");
            return true;
        } catch (SQLException e) {
            System.out.println("\nErrore nella query SQL:\n" + e);
            return false;
        }
    }

    public static String bytesToHex(byte[] hash) {
        /* conversione bytes in caratteri*/

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

    public static String createDigest(String psw){
        MessageDigest digest = null;
        String sha3Hex;

        try {
            /* cerchiamo l'algoritmo che dobbiamo usare, lo applichiamo e viene restituito un array di byte
             *  del message digest
             *  N.B dobbiamo convertire i byte in stringa
             */

            digest = MessageDigest.getInstance("SHA3-256");
            final byte[] hashbytes = digest.digest(psw.getBytes(StandardCharsets.UTF_8));
            sha3Hex = bytesToHex(hashbytes);

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        /* prendi la stringa del numero telefonico e convertilo in intero
         *  N.B: si accettano formati diversi (possono includere +, ., parentesi ...)*/
        return sha3Hex;
    }

    public String getUserType(String username){
        String searchAdmin = "SELECT * FROM AMMINISTRATORI WHERE USERNAME='" + username + "'";
        String searchClienti = "SELECT * FROM CLIENTI WHERE USERNAME='" + username + "'";
        ResultSet clienti = getInfoDB(searchClienti);
        try{
            if(clienti.next()){
                boolean isAderente= (boolean) clienti.getObject("ADERENTE");
                if(isAderente){
                    return "aderente";
                }
                else return "simpatizzante";
            }
            else {
                ResultSet admin = getInfoDB(searchAdmin);
                if(admin.next()) {
                    return "admin";
                }
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Errore nella ricerca dell'utente";
    }

}