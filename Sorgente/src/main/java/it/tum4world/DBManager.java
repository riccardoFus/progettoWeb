package it.tum4world;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.http.HttpServlet;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;

public class DBManager extends HttpServlet {
    // classe padre che contiene tutti i metodi per comunicare con il DB

    protected Connection con = null;
    protected String URLDB = "jdbc:derby://localhost:1527/Tum4WorldDB; create=true";
    protected String user = "APP";
    protected String password = "admin";


    public void init() {

        //caricamento del driver jdbc
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("\nLoading del driver ha avuto successo\n");
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
            // chiusura della connessione
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public ResultSet getInfoDB(String query) {
        // metodo per implementare query nel quale otteniamo info dal db
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

    protected boolean updateDB(String update) {
        // metodo per implementare query nel quale modifichiamo il db
        try {
            Statement stmnt = con.createStatement();
            stmnt.executeUpdate(update);
            System.out.println("\nQuery SQL ha avuto successo\n");
            return true;
        } catch (SQLException e) {
            System.out.println("\nErrore nella query SQL:\n" + e);
            return false;
        }
    }

    // bytesToHex e createDigest sono usate per implementare l'hashing della password
    public static String bytesToHex(byte[] hash) {
        /* conversione bytes in caratteri*/

        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    public static String createDigest(String psw) {
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

    public String getUserType(String username) {
        // con questa query ricerchiamo che tipo di utente ha effettuale l'accesso, utile per implementare header dinamico
        String searchAdmin = "SELECT * FROM AMMINISTRATORI WHERE USERNAME='" + username + "'";
        String searchClienti = "SELECT * FROM CLIENTI WHERE USERNAME='" + username + "'";
        ResultSet clienti = getInfoDB(searchClienti);
        try {
            if (clienti.next()) {
                boolean isAderente = (boolean) clienti.getObject("ADERENTE");
                if (isAderente) {
                    return "aderente";
                } else return "simpatizzante";
            } else {
                ResultSet admin = getInfoDB(searchAdmin);
                if (admin.next()) {
                    return "admin";
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Errore nella ricerca dell'utente";
    }

    public JsonArray getJsonUsers(String query) {
        // metodo per ottenere la lista in json degli utenti per la tabella degli utenti nella pagina privata dell'admin
        ArrayList<UsersBean> users = new ArrayList<UsersBean>();
        ResultSet result = getInfoDB(query);
        try{
            while(result.next()){
                UsersBean user = new UsersBean();
                user.setUsername(result.getString("username"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                users.add(user);
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        JsonArray array = new JsonArray();
        for(UsersBean user : users){
            Gson gson = new Gson();
            array.add(gson.toJson(user));
        }
        return array;

    }
    public JsonArray getJsonClienti(String query) {
        // metodo per ottenere la lista in json dei clienti per la tabella dei clienti nella pagina privata dell'admin
        ArrayList<ClientsBean> clients = new ArrayList<ClientsBean>();
        ResultSet result = getInfoDB(query);
        try{
            while(result.next()){
                ClientsBean client = new ClientsBean();
                client.setUsername(result.getString("username"));
                client.setEmail(result.getString("email"));
                client.setName(result.getString("nome"));
                client.setSurname(result.getString("cognome"));
                client.setAderente(result.getBoolean("aderente"));
                client.setDateOfBirth(result.getDate("data_di_nascita"));
                client.setPassword(result.getString("password"));
                client.setTelefono(result.getString("telefono"));
                clients.add(client);
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        JsonArray array = new JsonArray();
        for(ClientsBean client : clients){
            Gson gson = new Gson();
            array.add(gson.toJson(client));
        }
        return array;

    }

    public JsonArray getJsonVisite(String query){
        // metodo per ottenere la lista in json delle visite per l'istogramma delle visite nella pagina privata dell'admin
        ArrayList<VisitsBean> visits = new ArrayList<VisitsBean>();
        ResultSet result = getInfoDB(query);
        try{
            while(result.next()){
                VisitsBean visit = new VisitsBean();
                visit.setPage(result.getString("page"));
                visit.setVisits(result.getInt("visits"));
                visits.add(visit);
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        JsonArray array = new JsonArray();
        for(VisitsBean visit : visits){
            Gson gson = new Gson();
            array.add(gson.toJson(visit));
        }
        return array;
    }


    public JsonArray getJsonDonazioni(String query){
        // metodo per ottenere la lista in json delle donazioni utile per l'istogramma delle donazioni nella pagina privata dell'admin
        ArrayList<DonationsBean> donations = new ArrayList<DonationsBean>();
        ResultSet result = getInfoDB(query);
        try{
            while(result.next()){
                DonationsBean donation = new DonationsBean();
                donation.setUsername(result.getString("username"));
                donation.setData(result.getString("data"));
                donation.setQuota(result.getDouble("quota"));
                donations.add(donation);
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
        JsonArray array = new JsonArray();
        for(DonationsBean donation : donations){
            Gson gson = new Gson();
            array.add(gson.toJson(donation));
        }
        return array;
    }
}
