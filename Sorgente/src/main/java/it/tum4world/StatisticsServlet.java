package it.tum4world;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
import java.util.ArrayList;

@WebServlet(name = "StatisticsServlet", value = "/StatisticsServlet")
public class StatisticsServlet extends DBManager {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonArray array;
        if (request.getParameter("action").equals("reset")) {
            updateDB("UPDATE VISITE SET visits=0");
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            PrintWriter writer = response.getWriter();
            writer.println("Dati azzerati!");
            writer.flush();
        } else if (request.getParameter("action").equals("totalViews")) {
            ResultSet views = getInfoDB("SELECT SUM(visits) FROM VISITE");
            String result;

            try {
                if (views.next()) {
                    result = views.getString(1);
                } else {
                    result = "Errore nel caricamento dei dati";
                    System.err.println("Errore");
                }
                views.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            PrintWriter writer = response.getWriter();
            writer.println(result);
            writer.flush();

        } else if (request.getParameter("action").equals("totalSubscriptions")) {
            array = getJsonUsers("SELECT * FROM UTENTI WHERE username != 'admin'");
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            try (PrintWriter writer = response.getWriter()) {
                writer.println(array);
                writer.flush();
                System.err.println(array);
            } catch (IOException ex) {
                System.err.println("Errore");
            }
        } else if (request.getParameter("action").equals("aderenteSubscriptions")) {
                array = getJsonClienti("SELECT * FROM CLIENTI INNER JOIN UTENTI ON CLIENTI.username=UTENTI.username WHERE ADERENTE=TRUE");
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                try (PrintWriter writer = response.getWriter()) {
                    writer.println(array);
                    writer.flush();
                } catch (IOException ex) {
                    System.err.println("Errore");
                }

            } else if (request.getParameter("action").equals("simpatizzanteSubscriptions")) {
                array = getJsonClienti("SELECT * FROM CLIENTI INNER JOIN UTENTI ON CLIENTI.username=UTENTI.username WHERE ADERENTE=FALSE");
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                try (PrintWriter writer = response.getWriter()) {
                    writer.println(array);
                    writer.flush();
                } catch (IOException ex) {
                    System.err.println("Errore");
                }

            } else if(request.getParameter("action").equals("plotDonazioni")) {
            array = getJsonDonazioni("SELECT * from donazioni WHERE year(data) = "+ Year.now().getValue() + "");
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            try (PrintWriter writer = response.getWriter()) {
                writer.println(array);
                writer.flush();
                System.out.println(array);
            } catch (IOException ex) {
                System.err.println("Errore");
            }
        }

            else {
                array = getJsonVisite("SELECT page, visits FROM VISITE");
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                try (PrintWriter writer = response.getWriter()) {
                    writer.println(array);
                    writer.flush();
                    System.out.println("Ciao");
                    System.out.println(array);
                } catch (IOException ex) {
                    System.err.println("Errore");
                }
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
