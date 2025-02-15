package com.whiskeylog.backend.services;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whiskeylog.backend.dto.WhiskeyDataDTO;
// ｻｰﾋﾞｽｸﾗｽはﾘﾎﾟｼﾞﾄﾘｸﾗｽだけをｲﾝﾎﾟｰﾄするべき(単一責任)
import com.whiskeylog.backend.entity.WhiskeyEntity;
import com.whiskeylog.backend.repository.WhiskeyRepository;

import jakarta.transaction.Transactional;

@Service // ｻｰﾋﾞｽｸﾗｽであることを表すｱﾉﾃｰｼｮﾝ
public class WhiskeyService {

    @Autowired
    private WhiskeyRepository whiskeyRepository;

    @Transactional
    public int InsertWhiskeyData(WhiskeyDataDTO whiskeyData) throws IOException {
        // 文字列データを取得
        String alcoVol = whiskeyData.getAlcoVol();
        String country = whiskeyData.getCountry();
        String name = whiskeyData.getName();
        String price = whiskeyData.getPrice();
        String type = whiskeyData.getType();

        // Whiskey エンティティを作成
        WhiskeyEntity whiskeyEntity = new WhiskeyEntity();
        whiskeyEntity.setAlcoVol(alcoVol);
        whiskeyEntity.setCountry(country);
        whiskeyEntity.setName(name);
        whiskeyEntity.setPrice(price);
        whiskeyEntity.setType(type);

        //JpaRepositoryのsave()は登録後のEntityを返す。そこからID取得し返却
        whiskeyRepository.save(whiskeyEntity);
        return whiskeyEntity.getId();
    }
}
