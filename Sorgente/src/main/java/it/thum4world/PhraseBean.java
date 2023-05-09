package it.thum4world;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Random;

public class PhraseBean implements Serializable {

    String phrase;

    public PhraseBean() {
        phrase = "Citazione di default";
    }

    /**
     * Metodo per ottenere una nuova frase. Nella versione statica la sceglie
     * fra una lista predefinita. Con l'aggiunta della connessione al database
     * le frasi saranno caricate dinamicamente
     * @return Nuova frase da impostare sul sito
     */
    public String getPhrase() {

        ArrayList<String> phrases = new ArrayList<>();

        phrases.add("Si vive una sola volta. E qualcuno neppure una. Woody Allen");
        phrases.add("Una vita senza ricerca non è degna di essere vissuta -Socrate");
        phrases.add("Cadere sette volte e alzarsi otto. Proverbio-giapponese");

        Random rnd = new Random();
        int choice = rnd.nextInt(phrases.size());

        phrase = phrases.get(choice);

        return phrase;
    }

    /**
     * Aggiorno la frase corrente sul sito. La modifica non è persistente, e la
     * frase durerà per i suoi canonici 20 secondi
     * @param phrase La frase da caricare su ogni pagina del sito
     */
    public void setPhrase(String phrase) {
        this.phrase = phrase;
    }

    @Override
    public String toString() {
        return this.getPhrase();
    }
}
