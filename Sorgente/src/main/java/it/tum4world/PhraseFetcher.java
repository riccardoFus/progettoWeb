package it.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet(name = "PhraseFetcher", value = "/PhraseFetcher")
public class PhraseFetcher extends DBManager {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Recupero le frasi salvate nel DB

        ResultSet rs = getInfoDB("SELECT * FROM frasi");
        ArrayList<String> frasi = new ArrayList<>();

        try {
            while (rs.next()) {
                frasi.add(rs.getString(2));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }

        // Gestisco la risposta

        Gson gson = new Gson();
        JsonObject json = new JsonObject();

        if (frasi.size() > 0) {

            Random rnd = new Random();
            int scelta = rnd.nextInt(frasi.size());

            json.addProperty("frase", frasi.get(scelta));
        }
        else {
            json.addProperty("errore", "Nessuna frase trovata");
        }

        // Invio la risposta

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");

        try (PrintWriter writer = resp.getWriter()) {
            writer.write(gson.toJson(json));
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
