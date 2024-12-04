package com.whiskeylog.backend.Entity;

public class LoginRequestEntity {
    private int id;
    private String username;

    // コンストラクタ
    public LoginRequestEntity() {}

    // ゲッターとセッター
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
