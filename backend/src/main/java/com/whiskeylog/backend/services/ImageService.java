package com.whiskeylog.backend.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import com.whiskeylog.backend.entity.ImageEntity;
import com.whiskeylog.backend.repository.ImageRepository;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    @Transactional
    public void InsertBlobData(@RequestBody Map<String, String> formData) throws IOException {

        ImageEntity image = new ImageEntity();
        image.setWhiskeyId(Integer.valueOf(formData.get("whiskeyId")));
        image.setName(formData.get("name"));
        image.setImageData(formData.get("image").getBytes(StandardCharsets.UTF_8));
        
        imageRepository.save(image);
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
