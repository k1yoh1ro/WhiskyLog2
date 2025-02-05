package com.whiskeylog.backend.services;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

// ｻｰﾋﾞｽｸﾗｽはﾘﾎﾟｼﾞﾄﾘｸﾗｽだけをｲﾝﾎﾟｰﾄするべき(単一責任)
import com.whiskeylog.backend.entity.WhiskeyEntity;
import com.whiskeylog.backend.repository.WhiskeyRepository;

import jakarta.transaction.Transactional;

@Service // ｻｰﾋﾞｽｸﾗｽであることを表すｱﾉﾃｰｼｮﾝ
public class WhiskeyService {

    @Autowired
    private WhiskeyRepository whiskeyRepository;

    @Transactional
    public void InsertWhiskeyData(@RequestBody Map<String, Object> formData) throws IOException {
        
        WhiskeyEntity whiskey = new WhiskeyEntity();
        whiskey.setName(String.valueOf(formData.get("name")));
        whiskey.setCountry(String.valueOf(formData.get("country")));
        whiskey.setType(String.valueOf(formData.get("type")));
        whiskey.setAlcoVol(String.valueOf(formData.get("alcoVol")));
        whiskey.setPrice(String.valueOf(formData.get("price")));

        whiskeyRepository.save(whiskey);
    }
}
