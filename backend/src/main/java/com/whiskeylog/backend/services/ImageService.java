package com.whiskeylog.backend.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileOutputStream;
import java.io.IOException;

import com.whiskeylog.backend.repository.ImageRepository;
import com.whiskeylog.backend.model.Image;

@Service
public class ImageService {
    
    @Autowired
    private ImageRepository imageRepository;

    public void InsertBlobData(Long id, String name, byte[] file) throws IOException {
        Image image = new Image();

        image.setId(id);
        image.setWhiskeyId(id);
        image.setName(name);
        image.setWhiskeyData(file);
        
        imageRepository.save(image);
    }

    public void GetBlobData(Long id, String outputFilePath) throws IOException {
        Image image = imageRepository.findById(id)
                                        .orElseThrow(() -> new IllegalArgumentException("File not found"));
        byte[] imageData = image.getWhiskeyData();
        try (FileOutputStream outputStream = new FileOutputStream(outputFilePath)) {
            outputStream.write(imageData);
        }
    }
}
