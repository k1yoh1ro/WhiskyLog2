package com.whiskeylog.backend.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
@CrossOrigin(origins = "http://localhost:3000")
public class ImageController {
    
    // @Autowired
    // private ImageService imageService;

    // @PostMapping(value = "/image/upload", consumes = "multipart/form-data")
    // public ResponseEntity<Map<String, Object>> uploadImage(
    //     @ModelAttribute ImageDTO imageData) {
    //     try {
    //         imageService.InsertBlobData(imageData);
    //         return ResponseEntity.ok(Map.of("OKStatus", "OK"));
    //     } catch (IOException e) {
    //         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
    //                 .body(Map.of("NGStatus", "Data insert failed: " + e.getMessage()));
    //     }
    // }

    // @GetMapping("/image/download")
    // public List<ImageDTO> downloadImages() throws IOException {
    //     return imageService.getAllImages().stream()
    //             .map(image -> new ImageDTO(
    //                 image.getId(),
    //                 image.getName(),
    //                 image.getWhiskeyId(),
    //                 Base64.getEncoder().encodeToString(image.getImageData())))
    //             .collect(Collectors.toList());
    // }
}
