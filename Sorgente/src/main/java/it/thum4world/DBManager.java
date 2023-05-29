package it.thum4world;

import javax.servlet.http.HttpServlet;
import java.sql.*;

public class DBManager extends HttpServlet {

    protected Connection con;
    protected String URLDB= "jdbc:derby://localhost:1527/Tum4WorldDB";
    //protected String user = "admin";
    //protected String psw = "admin";

    public void init(){

        //caricamento del driver jdbc
        final String DERBY_CLIENT = "org.apache.derby.jdbc.ClientDriver";
        try {
            Class.forName(DERBY_CLIENT);
            System.out.println("\nLoading ha avuto successo\n");
        } catch (ClassNotFoundException ex) {
            // errore nell caricamento del driver
            System.out.println("\nErrore: caricamento del driver jdbc fallito\n");
            System.out.println("\nDettagli:\n" + ex);
        }finally{
            try {
                con =  DriverManager.getConnection(URLDB);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            con.close();
            DriverManager.getConnection("jdbc:derby:;shutdown=true;deregister=false");
        } catch (SQLException e){
            System.gc();
        }

    }

    protected ResultSet getInfoDB(String query){
        ResultSet resultSet;

        try {
            // apri/riusa connessione
            Statement stmnt = con.createStatement();
            resultSet = stmnt.executeQuery(query);
        } catch (SQLException e) {
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
}