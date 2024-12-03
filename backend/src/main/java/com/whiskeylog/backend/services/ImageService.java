package com.whiskeylog.backend.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;

import com.whiskeylog.backend.Entity.ImageEntity;
import com.whiskeylog.backend.repository.ImageRepository;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    @Transactional
    public void InsertBlobData(int id, String name, MultipartFile file) throws IOException {

        ImageEntity image = new ImageEntity();
        image.setWhiskeyId(id);
        image.setName(name);
        image.setImageData(file.getBytes());
        String type = file.getBytes().getClass().getSimpleName();
        System.out.println(type);
        System.out.println(file);
        
        imageRepository.save(image);
    }

    @Transactional
    public void GetBlobData(int id, String outputFilePath) throws IOException {
        ImageEntity image = imageRepository.findById(id)
                                        .orElseThrow(() -> new IllegalArgumentException("File not found"));
        byte[] imageData = image.getImageData();
        try (FileOutputStream outputStream = new FileOutputStream(outputFilePath)) {
            outputStream.write(imageData);
        }
    }

    public static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            // 各バイトを16進数形式で追加
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}
