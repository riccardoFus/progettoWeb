package it.tum4world;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "SendEmail", value = "/SendEmail")
public class SendEmail extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Mittente email : il nostro utente
        String to = request.getParameter("email");
        // Destinazione email : l'associazione
        String from = "tum4world@nessunonoluogonoesiste.com";
        // Fake host del nostro server di posta
        String host = "localhost";
        // Otteniamo le proprietà di sistema
        Properties props = System.getProperties();

        // Setup della server mail
        props.put("mail.stmp.host", host);
        props.put("mail.smtp.port", "465");

        // Ottengo oggetto Sessione javax.mail
        Session session = Session.getDefaultInstance(props);

        try{
            // Creo un oggetto di default MimeMessage
            MimeMessage msg = new MimeMessage(session);
            // Imposto il mittente
            msg.setFrom(new InternetAddress(from));
            // Imposto il destinatario
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Imposto il soggetto del messaggio
            msg.setSubject("Richiesta da parte di " + request.getParameter("name") + " " + request.getParameter("surname"));
            // Imposto il testo effettivo del messaggio
            msg.setText("Motivazione richiesta : " + request.getParameter("reasons") + "\nAltre informazioni : " + request.getParameter("altro"));
            // Invio la mail effettiva
            Transport.send(msg);
            // Torno alla pagina di invio confermato
            response.sendRedirect(response.encodeURL("invio_confermato.jsp"));
        } catch (AddressException e) {
            response.sendRedirect(response.encodeURL("invio_confermato.jsp"));
        } catch (MessagingException e) {
            response.sendRedirect(response.encodeURL("invio_confermato.jsp"));
        } catch (IOException e) {
            response.sendRedirect(response.encodeURL("invio_confermato.jsp"));
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
