package it.tum4world;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
        if(request.getParameter("action").equals("reset")){
            updateDB("UPDATE VISITE SET visits=0");
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            PrintWriter writer = response.getWriter();
            writer.println("Dati azzerati!");
            writer.flush();
        }
        else if(request.getParameter("action").equals("totalViews")) {
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
        }
        else {
            JsonObject jsonData = new JsonObject();
            JsonArray jsonArray = new JsonArray();
            ResultSet views = getInfoDB(("SELECT page, SUM(visits) AS visits FROM VISITE GROUP BY page"));

            try {
                while (views.next()) {
                    JsonObject item = new JsonObject();
                    String pages = views.getString("page");
                    int visits = views.getInt("visits");
                    item.addProperty("pages", pages);
                    item.addProperty("visits", visits);
                    jsonArray.add(item);
                }
                // Aggiungo l'oggetto JSON all'array JSON
            } catch(SQLException e){
                throw new RuntimeException();
            }

            Gson gson = new Gson();
            String jsonString = gson.toJson(jsonData);
            response.setContentType("application/json");
            response.getWriter().write(jsonString);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
