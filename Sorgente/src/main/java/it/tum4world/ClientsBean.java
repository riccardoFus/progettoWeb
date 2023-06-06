package it.tum4world;

import java.io.Serializable;
import java.util.Date;

public class ClientsBean implements Serializable {
    String username;
    String name;
    String surname;
    String password;
    String email;
    Date dateOfBirth;
    String telefono;
    Boolean aderente;

    public ClientsBean() {
    }

    @Override
    public String toString() {
        return "UsersBean{" +
                "username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", telefono='" + telefono + '\'' +
                ", aderente=" + aderente +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
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

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Boolean getAderente() {
        return aderente;
    }

    public void setAderente(Boolean aderente) {
        this.aderente = aderente;
    }
}
