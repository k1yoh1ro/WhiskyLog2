package com.whiskeylog.backend.model;

public class LoginRequest {
    private String id;
    private String login_pass;

    // コンストラクタ
    public LoginRequest() {}

    // ゲッターとセッター
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLogin_pass() {
        return login_pass;
    }

    public void setLogin_pass(String login_pass) {
        this.login_pass = login_pass;
    }
}
