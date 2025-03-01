package com.whiskeylog.backend.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity //ｴﾝﾃｨﾃｨｸﾗｽであることを表すｱﾉﾃｰｼｮﾝ
@Table(name = "whiskeys") // 主ﾃｰﾌﾞﾙを表すｱﾉﾃｰｼｮﾝ
public class WhiskeyEntity {
    @Id //Entityの主ｷｰであることを表すｱﾉﾃｰｼｮﾝ
    @GeneratedValue(strategy = GenerationType.IDENTITY) //主ｷｰを生成する
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "country", nullable = false)
    private String country;

    @Column(name = "type")
    private String type;

    @Column(name = "alco_vol")
    private String alcoVol;

    @Column(name = "price")
    private String price;

    @Column(name = "rate1")
    private String rate1;

    @Column(name = "rate2")
    private String rate2;

    @Column(name = "rate3")
    private String rate3;

    @Column(name = "rate4")
    private String rate4;

    @Column(name = "rate5")
    private String rate5;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAlcoVol() {
        return alcoVol;
    }

    public void setAlcoVol(String alcoVol) {
        this.alcoVol = alcoVol;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getRate1() {
        return rate1;
    }

    public void setRate1(String rate1) {
        this.rate1 = rate1;
    }

    public String getRate2() {
        return rate2;
    }

    public void setRate2(String rate2) {
        this.rate2 = rate2;
    }

    public String getRate3() {
        return rate3;
    }

    public void setRate3(String rate3) {
        this.rate3 = rate3;
    }

    public String getRate4() {
        return rate4;
    }

    public void setRate4(String rate4) {
        this.rate4 = rate4;
    }

    public String getRate5() {
        return rate5;
    }

    public void setRate5(String rate5) {
        this.rate5 = rate5;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

}
