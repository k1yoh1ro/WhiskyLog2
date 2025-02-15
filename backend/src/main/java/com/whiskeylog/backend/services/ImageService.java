package com.whiskeylog.backend.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import com.whiskeylog.backend.dto.WhiskeyDataDTO;
import com.whiskeylog.backend.entity.ImageEntity;
import com.whiskeylog.backend.repository.ImageRepository;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    @Transactional
    public void InsertBlobData(WhiskeyDataDTO whiskeyData) throws IOException {
        try {
            //データを取得
            int whiskeyId = whiskeyData.getWhiskeyId();
            String name = whiskeyData.getName();
            byte[] image = whiskeyData.getImage().getBytes();
    
            ImageEntity imageEntity = new ImageEntity();
            imageEntity.setWhiskeyId(whiskeyId);
            imageEntity.setName(name);
            imageEntity.setImageData(image);
            
            imageRepository.save(imageEntity);

        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid whiskeyId: " + whiskeyData.getWhiskeyId(), e);
        }
    }

    @Transactional
    public void GetBlobData(int id, String outputFilePath) throws IOException {
        ImageEntity image = imageRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Image with ID " + id + " not found"));
        
        byte[] imageData = image.getImageData();
        try (FileOutputStream outputStream = new FileOutputStream(outputFilePath)) {
            outputStream.write(imageData);
        } catch (IOException e) {
            throw new IOException("Failed to write image data to file: " + outputFilePath, e);
        }
    }

    @Transactional
    public List<ImageEntity> getAllImages() throws IOException {
        return imageRepository.findAll();
    }
}
