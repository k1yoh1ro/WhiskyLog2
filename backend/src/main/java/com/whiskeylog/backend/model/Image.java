package com.whiskeylog.backend.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "whiskey_image")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "whiskey_id", nullable = false)
    private Long whiskeyId;

    @Column(name = "name")
    private String name;

    @Lob
    @Column(name = "image_data", nullable = false)
    private byte[] whiskeyData;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getWhiskeyId() {
        return whiskeyId;
    }

    public void setWhiskeyId(Long whiskeyId) {
        this.whiskeyId = whiskeyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getWhiskeyData() {
        return whiskeyData;
    }

    public void setWhiskeyData(byte[] whiskeyData) {
        this.whiskeyData = whiskeyData;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

}
