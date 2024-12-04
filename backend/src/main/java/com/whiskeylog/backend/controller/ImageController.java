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
    public String downloadImage(@PathVariable int imageId, @RequestParam("outputFilePath") String outputFilePath) {
        try {
            imageService.GetBlobData(imageId, outputFilePath);
            return "File downloaded successfully!";
        } catch (IOException e) {
            return "File download failed: " + e.getMessage();
        }
    }
}
