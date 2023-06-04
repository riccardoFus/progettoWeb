package it.tum4world;

import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "StatisticsServlet", value = "/StatisticsServlet")
public class StatisticsServlet extends DBManager {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultSet views = getInfoDB("SELECT SUM(visits) FROM VISITE");
        String result;
        System.err.println("Mi stai chiamando");

        try {
            if (views.next()) {
                result = views.getString(1);
                System.err.println(views.getString(1));
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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
