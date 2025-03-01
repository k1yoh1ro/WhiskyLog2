package com.whiskeylog.backend.services;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whiskeylog.backend.dto.WhiskeyDataDTO;
// ｻｰﾋﾞｽｸﾗｽはﾘﾎﾟｼﾞﾄﾘｸﾗｽだけをｲﾝﾎﾟｰﾄするべき(単一責任)
import com.whiskeylog.backend.entity.WhiskeyEntity;
import com.whiskeylog.backend.repository.WhiskeyRepository;
import com.whiskeylog.backend.services.ImageService;


import jakarta.transaction.Transactional;

@Service // ｻｰﾋﾞｽｸﾗｽであることを表すｱﾉﾃｰｼｮﾝ
public class WhiskeyService {
    
    private WhiskeyRepository whiskeyRepository;
    private ImageService imageService;

    @Autowired
    public WhiskeyService(WhiskeyRepository whiskeyRepository, ImageService imageService) {
        this.whiskeyRepository = whiskeyRepository;
        this.imageService = imageService;
    }

    @Transactional
    public void InsertWhiskeyData(WhiskeyDataDTO whiskeyData) throws IOException {
        try {
            WhiskeyEntity whiskeyEntity = new WhiskeyEntity();
            whiskeyEntity.setAlcoVol(whiskeyData.getAlcoVol());
            whiskeyEntity.setCountry(whiskeyData.getCountry());
            whiskeyEntity.setName(whiskeyData.getName());
            whiskeyEntity.setPrice(whiskeyData.getPrice());
            whiskeyEntity.setType(whiskeyData.getType());
    
            whiskeyRepository.save(whiskeyEntity);
            
            whiskeyData.setWhiskeyId(whiskeyEntity.getId());
            imageService.InsertBlobData(whiskeyData);
        } catch (IOException e) {
            throw new IOException("failed" + e.getMessage());
        }
    }
}
