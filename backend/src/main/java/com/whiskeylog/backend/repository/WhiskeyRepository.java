package com.whiskeylog.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// ﾘﾎﾟｼﾞﾄﾘｸﾗｽはｴﾝﾃｨﾃｨｸﾗｽだけをｲﾝﾎﾟｰﾄするべき(単一責任)
import com.whiskeylog.backend.entity.WhiskeyEntity;

@Repository //ﾘﾎﾟｼﾞﾄﾘｸﾗｽであることを表すｱﾉﾃｰｼｮﾝ
public interface WhiskeyRepository extends JpaRepository<WhiskeyEntity, Integer> {   
}
