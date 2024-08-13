package com.whiskylog.backend.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class testController {

    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping("/data")
    public DataResponse getData() {
        return new DataResponse("Hello from backend");
    }

    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping("/data")
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