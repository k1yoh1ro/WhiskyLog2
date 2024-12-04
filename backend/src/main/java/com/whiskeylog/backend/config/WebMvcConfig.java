package com.whiskeylog.backend.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:3000") // 許可するオリジン
                .allowedMethods("GET", "POST", "PUT", "DELETE") // 許可するHTTPメソッド
                .allowedHeaders("*") // 許可するヘッダー
                .allowCredentials(true); // クッキーの共有を許可
    }
}