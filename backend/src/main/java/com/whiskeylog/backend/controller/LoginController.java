package com.whiskeylog.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.whiskeylog.backend.model.LoginRequest;
import com.whiskeylog.backend.model.User;
import com.whiskeylog.backend.services.UserService;


@RestController
@RequestMapping("/")
public class LoginController {

    @Autowired
    private UserService userServ;

    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping("/login")
    public ResponseEntity<User> getData(@RequestBody LoginRequest lr) {

        String id = lr.getId();
        User u = userServ.getUserById(id);

        if (u != null) {
            return ResponseEntity.ok(u);
        } else {
            // ユーザーが見つからない場合、404エラーを返す
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @GetMapping("/allUsers")
    public List<User> getAllUserData() {
        return userServ.getAllUsers();
    }
}
