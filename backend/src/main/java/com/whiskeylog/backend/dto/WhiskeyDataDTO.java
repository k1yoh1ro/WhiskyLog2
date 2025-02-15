package com.whiskeylog.backend.dto;

import org.springframework.web.multipart.MultipartFile;

public class WhiskeyDataDTO {
    private String name;
    private String country;
    private String type;
    private String alcoVol;
    private String price;
    private MultipartFile image;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAlcoVol() {
        return this.alcoVol;
    }

    public void setAlcoVol(String alcoVol) {
        this.alcoVol = alcoVol;
    }

    public String getPrice() {
        return this.price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public MultipartFile getImage() {
        return this.image;
    }

    public void setImage(MultipartFile file) {
        this.image = file;
    }
}
