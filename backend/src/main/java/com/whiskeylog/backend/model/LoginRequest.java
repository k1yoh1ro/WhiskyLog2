package com.whiskeylog.backend.model;

public class LoginRequest {
    private String id;
    private String password;

    // コンストラクタ
    public LoginRequest() {}

    // ゲッターとセッター
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
}
