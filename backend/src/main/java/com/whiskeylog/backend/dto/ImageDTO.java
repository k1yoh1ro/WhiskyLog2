package com.whiskeylog.backend.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImageDTO {
    private String whiskeyId;
    private String name;
    private MultipartFile image;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWhiskeyId() {
        return this.whiskeyId;
    }

    public void setWhiskeyId(String whiskeyId) {
        this.whiskeyId = whiskeyId;
    }

    public MultipartFile getImage() {
        return this.image;
    }

    public void setImage(MultipartFile data) {
        this.image = data;
    }

}
