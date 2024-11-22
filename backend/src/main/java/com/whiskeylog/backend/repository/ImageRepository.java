package com.whiskeylog.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.whiskeylog.backend.model.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> { 
}
