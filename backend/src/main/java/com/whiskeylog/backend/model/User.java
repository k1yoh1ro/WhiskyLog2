package com.whiskeylog.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;

    @Column(name = "login_pass")
    private String login_pass;
    
    @Column(name = "name_f")
    private String name_f;
    
    @Column(name = "name_l")
    private String name_l;
    
    @Column(name = "age")
    private String age;

    @Column(name = "mail_address")
    private String mail_address;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName_f() {
        return name_f;
    }

    public void setName_f(String name_f) {
        this.name_f = name_f;
    }
    
    public String getName_l() {
        return name_l;
    }

    public void setName_l(String name_l) {
        this.name_l = name_l;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getMailAddress() {
        return mail_address;
    }

    public void setMailAddress(String mail_address) {
        this.mail_address = mail_address;
    }
}
