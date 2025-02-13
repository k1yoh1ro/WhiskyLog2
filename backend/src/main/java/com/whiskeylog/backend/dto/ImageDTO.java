package com.whiskeylog.backend.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImageDTO {
    private int id;
    private int whiskeyId;
    private String name;
    private MultipartFile image;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getWhiskeyId() {
        return this.whiskeyId;
    }

    public void setWhiskeyId(int whiskeyId) {
        this.whiskeyId = whiskeyId;
    }

    public MultipartFile getImage() {
        return this.image;
    }

    public void setImage(MultipartFile data) {
        this.image = data;
    }

}
