package com.whiskylog.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class testController {
    @GetMapping("/greeting")
    public String greeting() {
        return "Hello Worldddd!";
    }
}