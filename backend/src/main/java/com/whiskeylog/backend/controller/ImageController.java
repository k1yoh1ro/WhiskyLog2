package com.whiskeylog.backend.controller;

import java.io.IOException;
import java.util.stream.Collectors;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.whiskeylog.backend.dto.ImageDTO;

import com.whiskeylog.backend.services.ImageService;

@RestController
@RequestMapping("/")
public class ImageController {
    
    @Autowired
    private ImageService imageService;

    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping("/image/upload")
    public Map<String, String> uploadImage(@RequestBody Map<String, String> formData) {
        try {
            imageService.InsertBlobData(formData);
            return Map.of("OKStatus", "OK");
        } catch (IOException e) {
            return Map.of("NGStatus", "Data insert failed: " + e.getMessage());
        }
    }

    @GetMapping("/image/download")
    public List<ImageDTO> downloadImages() throws IOException {
        return imageService.getAllImages().stream()
                .map(image -> new ImageDTO(
                    image.getId(),
                    image.getName(),
                    image.getWhiskeyId(),
                    Base64.getEncoder().encodeToString(image.getImageData())))
                .collect(Collectors.toList());
    }
}
