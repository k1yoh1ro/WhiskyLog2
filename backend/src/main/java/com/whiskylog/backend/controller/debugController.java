package com.whiskylog.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/debug")
public class debugController {
    @GetMapping("/greeting")
    public String debugGreeting() {
        return "Hello Debuggee!";
    }
}
