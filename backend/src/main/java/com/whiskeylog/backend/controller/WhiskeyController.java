package com.whiskeylog.backend.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.whiskeylog.backend.dto.WhiskeyDataDTO;
// ｺﾝﾄﾛｰﾗｰはｻｰﾋﾞｽｸﾗｽだけをｲﾝﾎﾟｰﾄするべき(単一責任)
import com.whiskeylog.backend.services.WhiskeyService;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@RestController
@RequestMapping("/")
@CrossOrigin(origins = "http://localhost:3000")
public class WhiskeyController {
    
    @Autowired
    private WhiskeyService whiskeyService;

    @PostMapping(value = "/put/whiskey-data", consumes = "multipart/form-data")
    public ResponseEntity<Map<String, String>> InsertWhiskeyData(
        @ModelAttribute WhiskeyDataDTO whiskeyData) {
        try {
            // 画像保存の外部キーに使用する為自動採番を返す
            int regId = whiskeyService.InsertWhiskeyData(whiskeyData);
            return ResponseEntity.ok(Map.of("regId", String.valueOf(regId)));
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("NGStatus", "Data insert failed: " + e.getMessage()));
        }
    }
}
