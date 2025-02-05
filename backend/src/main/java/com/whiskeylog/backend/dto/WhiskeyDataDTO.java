package com.whiskeylog.backend.dto;

import org.springframework.web.multipart.MultipartFile;

public class WhiskeyDataDTO {
    private String whiskeyId;
    private String name;
    private String country;
    private String type;
    private String alcoVol;
    private String price;
    private MultipartFile file;

    public void WhiskeyDTO(String whiskeyId, String name, String country, String type, String alcoVol, String price, MultipartFile file) {
        this.whiskeyId  = whiskeyId;
        this.name  = name;
        this.country = country;
        this.type = type;
        this.alcoVol = alcoVol;
        this.price = price;
        this.file = file;
    }

    public String getWhiskeyId() {
        return this.whiskeyId;
    }

    public void setWhiskeyId(String whiskeyId) {
        this.whiskeyId = whiskeyId;
    }

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

    public MultipartFile getFile() {
        return this.file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
