package it.tum4world;

import java.io.Serializable;
import java.util.Date;

public class DonationsBean implements Serializable {
    // Bean usato per recuperare i dati riguardanti le donazioni
    String username;
    String data;
    double quota;


    public DonationsBean() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public double getQuota() {
        return quota;
    }

    public void setQuota(double quota) {
        this.quota = quota;
    }
}
