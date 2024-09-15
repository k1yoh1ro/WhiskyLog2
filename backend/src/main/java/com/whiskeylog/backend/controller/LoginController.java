package com.whiskeylog.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.whiskeylog.backend.model.User;
import com.whiskeylog.backend.services.UserService;

@RestController
@RequestMapping("/")
public class LoginController {

    @Autowired
    private UserService userServ;

    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping("/login")
    public List<User> getData() {
        // DBに接続して、データ取得する
        return userServ.getAllUsers();
    }

    @PostMapping("/login")
    public DataResponse postData(@RequestBody DataRequest dataRequest) {
        return new DataResponse("Received: " + dataRequest.getMessage());
    }
}

class DataRequest {
    private String message;

    // Getters and setters
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

class DataResponse {
    private String response;

    public DataResponse(String response) {
        this.response = response;
    }

    // Getters and setters
    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}