package it.thum4world;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;
import java.sql.*;
public class DBManager extends HttpServlet {

    protected DataSource dataSource;

    public void init(){
        try{
            if(loadDriver()){
                // usa connection pooling: con tomcat si può definire la datasource necessaria nel fil econtext.xml
                dataSource = (DataSource) (new InitialContext()).lookup("java:/comp/env/jdbc/CSE");
                System.out.println("\nLoading ha avuto successo\n");

            }else{
                // errore nell caricamento del driver
                System.out.println("\nErrore: caricamento del driver jdbc fallito\n");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);

        }finally {
            if(!unloadDriver()){
                // errore
                System.out.println("\nErrore: unloading del driver jdbc fallito\n");
            }
        }
    }

    // metodo carica driver jdbc
    protected boolean loadDriver(){
        final String DERBY_CLIENT = "org.apache.derby.jdbc.ClientDriver";
        try {
            Class.forName(DERBY_CLIENT);
            return true;
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
            return false;
        }

    }

    // metodo unload il driver
    protected boolean unloadDriver() {
        try {
            DriverManager.getConnection("jdbc:derby:;shutdown=true;deregister=false");
        } catch (SQLException e){
            System.gc();
        }
        return false;
    }

    protected ResultSet getInfoDB(String query){
        Connection con;
        ResultSet resultSet;
        if(dataSource == null) {
            try {
                dataSource = (DataSource) (new InitialContext()).lookup("java:/comp/env/jdbc/CSE");
            } catch (NamingException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            // apri/riusa connessione
            con = dataSource.getConnection();
            Statement stmnt = con.createStatement();
            resultSet = stmnt.executeQuery(query);
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return resultSet;
    }

    protected boolean updateDB(String update){
        Connection con;
        try {
            // apri/riusa connessione
            con = dataSource.getConnection();
            Statement stmnt = con.createStatement();
            stmnt.executeUpdate(update);
            con.close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
}