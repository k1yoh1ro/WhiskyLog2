package com.whiskeylog.backend.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;

    @JsonProperty("password")
    private String password;
    
    @JsonProperty("username")
    private String username;
    
    @JsonProperty("mailaddress")
    private String mailaddress;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getMailAddress() {
        return mailaddress;
    }

    public void setMailAddress(String mail_address) {
        this.mailaddress = mail_address;
    }
}
