package com.whiskylog.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class testController {
    @GetMapping("api/greeting")
    public String greeting() {
        return "Hello World!";
    }
}
