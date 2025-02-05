package com.whiskeylog.backend.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// ｺﾝﾄﾛｰﾗｰはｻｰﾋﾞｽｸﾗｽだけをｲﾝﾎﾟｰﾄするべき(単一責任)
import com.whiskeylog.backend.services.WhiskeyService;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/")
public class WhiskeyController {
    
    @Autowired
    private WhiskeyService whiskeyService;

    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping(value = "/put/whiskey-data")
    public Map<String, String> InsertWhiskeyData(@RequestBody Map<String, Object> formData){ //推奨の@RequestParamにすると値が正常に受け取れない。原因は？
        try {
            whiskeyService.InsertWhiskeyData(formData);
            return Map.of("OKStatus", "OK"); // Next.jsにJSON形式で渡さないとエラーになる。
        } catch (IOException e) {
            return Map.of("NGStatus", "Data insert failed: " + e.getMessage());
        }
    }
}
