package it.tum4world;

import java.io.Serializable;
import java.util.Date;

public class UsersBean implements Serializable {
    // Bean usato per recuperare i dati riguardanti gli utenti
    String username;
    String password;
    String email;

    public UsersBean() {
    }

    @Override
    public String toString() {
        return "UsersBean{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
