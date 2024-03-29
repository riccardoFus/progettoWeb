package it.tum4world;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Type;

import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.stream.JsonReader;

@WebServlet(name = "ConsensoCookie", value = "/ConsensoCookie")
public class ConsensoCookie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();

        // riceve consenso ricevuto dalla finestra del cookie
        JsonObject json = new Gson().fromJson(requestBody, JsonObject.class);
        Boolean consent = json.get("consenso").getAsBoolean();

        // se cookie accettati, semplicemente aggiungo un attributo alla sessione acceptCookies = true
        if (consent == true) {
            session.setAttribute("acceptCookies", true);
        }
        else {
            // se cookie NON accettati, semplicemente aggiungo un attributo alla sessione acceptCookies = false e blocco tutti i cookie
            session.setAttribute("acceptCookies", false);

            for (Cookie c : req.getCookies()) {
                c.setMaxAge(0);
                resp.addCookie(c);
            }
        }

        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");

        try (PrintWriter writer = resp.getWriter()) {
            writer.println("{ \"consent\":\"" + consent + "\"}");
            writer.flush();
        }
    }
}
