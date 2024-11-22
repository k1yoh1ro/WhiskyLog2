package com.whiskeylog.backend.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.whiskeylog.backend.services.ImageService;

@RestController
@RequestMapping("/")
public class ImageController {
    
    @Autowired
    private ImageService imageService;

    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping("/image/upload")
    public String uploadImage(
        @RequestParam("whiskeyId") Long whiskeyId,
        @RequestParam("name") String name,
        @RequestPart("file") MultipartFile file) {
        try {
            imageService.InsertBlobData(whiskeyId, name, file.getBytes());
            return "File uploaded successfully!";
        } catch (IOException e) {
            return "File upload failed: " + e.getMessage();
        }
    }

    @GetMapping("/image/download")
    public String downloadImage(@PathVariable Long imageId, @RequestParam("outputFilePath") String outputFilePath) {
        try {
            imageService.GetBlobData(imageId, outputFilePath);
            return "File downloaded successfully!";
        } catch (IOException e) {
            return "File download failed: " + e.getMessage();
        }
    }
}
