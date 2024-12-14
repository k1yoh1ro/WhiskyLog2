package com.whiskeylog.backend.controller;

import java.io.IOException;
import java.util.stream.Collectors;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.whiskeylog.backend.Entity.ImageDTOEntity;
import com.whiskeylog.backend.services.ImageService;

@RestController
@RequestMapping("/")
public class ImageController {
    
    @Autowired
    private ImageService imageService;

    @PostMapping("/image/upload")
    public String uploadImage(
        @RequestParam("whiskeyId") int whiskeyId,
        @RequestParam("name") String name,
        @RequestPart("file") MultipartFile file) {
        try {
            imageService.InsertBlobData(whiskeyId, name, file);
            return "File uploaded successfully!";
        } catch (IOException e) {
            return "File upload failed: " + e.getMessage();
        }
    }

    @GetMapping("/image/download")
    public List<ImageDTOEntity> downloadImages() throws IOException {
        return imageService.getAllImages().stream()
                .map(image -> new ImageDTOEntity(
                    image.getId(),
                    image.getName(),
                    image.getWhiskeyId(),
                    Base64.getEncoder().encodeToString(image.getImageData())))
                .collect(Collectors.toList());
    }
}
