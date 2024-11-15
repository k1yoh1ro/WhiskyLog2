package com.whiskeylog.backend.model;

public class LoginRequest {
    private String id;
    private String username;

    // コンストラクタ
    public LoginRequest() {}

    // ゲッターとセッター
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
