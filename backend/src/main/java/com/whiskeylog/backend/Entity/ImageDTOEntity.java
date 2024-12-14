package com.whiskeylog.backend.Entity;

public class ImageDTOEntity {
    private int id;
    private int whiskeyId;
    private String name;
    private String imageData;

    public ImageDTOEntity(int id, String name, int whiskeyId, String imageData) {
        this.id = id;
        this.name = name;
        this.whiskeyId = whiskeyId;
        this.imageData = imageData;
    }

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

    public void setWhiskeyId(int contentType) {
        this.whiskeyId = contentType;
    }

    public String getImageData() {
        return this.imageData;
    }

    public void setImageData(String data) {
        this.imageData = data;
    }
}
