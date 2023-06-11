package it.tum4world;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "logIn", value = "/logIn")
public class logInServlet extends DBManager {
    @Override
    synchronized protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResultSet user = getLoginValues(req, resp);
        String response;

        try {
            //Se riceve una riga, allora il login è valido
            if (user.next()) {
                response = "";
            } else {
                response = "07: Login fallito!";
            }
            user.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");

        try (PrintWriter writer = resp.getWriter()) {
            Gson gson = new Gson();
            writer.println(gson.toJson(response));
            writer.flush();
        } catch (IOException ex) {
            //errore
            System.out.println("\nErrore: impossibile creare un json di risposta\n");
            System.out.println("\nDettagli:\n" + ex);
        }
    }

    @Override
    synchronized protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResultSet user = getLoginValues(req, resp);
        HttpSession session = req.getSession(true);
        try {
            if (user.next()) {
                String username = user.getObject("username").toString();
                String userType = getUserType(username);
                System.out.println("\nLogin in process of username" + username +  " user type: " + userType + "\n");

                //ritira la sessione per aggiungere gli attributi typeOfUser e username
                session.setAttribute("username", username);
                session.setAttribute("typeOfUser", userType);
                String url = resp.encodeURL(redirectUserType(userType));
                resp.sendRedirect(url);
            } else {
                System.err.println("Non funziona");
            }
            user.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private ResultSet getLoginValues(HttpServletRequest req, HttpServletResponse resp) {
        // query al db per ottenere l'eventuale utente legato alle credenziali inserite
        String username = req.getParameter("username");
        String psw = req.getParameter("password");
        String password = createDigest(psw);
        String checkUtente = "SELECT * FROM UTENTI WHERE USERNAME='" + username + "'AND PASSWORD='" + password + "'";
        ResultSet user = getInfoDB(checkUtente);
        return user;
    }

    private String redirectUserType(String userType) {
        // in base al tipo di utente indirizzo alla sua pagina privata
        switch (userType) {
            case "admin":
                return "AreaPersonaleAdmin.jsp";

            case "aderente":
                return "AreaPersonaleAderente.jsp";

            case "simpatizzante":
                return "AreaPersonaleSim.jsp";
        }
        return null;
    }
}
