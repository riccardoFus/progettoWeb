package it.tum4world;

import java.io.Serializable;

public class VisitsBean implements Serializable {
    // Bean usato per recuperare i dati riguardanti le visite sulle pagine
    String page;
    Integer visits;

    public VisitsBean() {
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public Integer getVisits() {
        return visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }
}
