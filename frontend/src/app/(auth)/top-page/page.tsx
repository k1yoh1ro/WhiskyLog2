'use client'

import React, { useEffect, useState } from "react";
import { downloadImages } from "@/app/api/api";

export default function Home() {

  const [images, setImages] = useState<any[]>([]);

  useEffect(() => {
    const fetchImages = async () => {
      try {
        const imageList = await downloadImages();
        setImages(imageList)
      } catch (error) {
        console.error("Error fetching images:", error);
      }
    };
    fetchImages();
  }, []);

  return (
    <>
      <div>ログイン成功</div>
      <div>
        {images.length > 0 ? (
          images.map((image) => (
            <div key={image.id}>
              <h3>{image.name}</h3>
              <img
                src={`data:image/jpg;base64,${image.imageData}`}
                alt={image.name}
                style={{ maxWidth: "200px", height: "auto" }}
              />
            </div>
          ))
        ) : (
          <p>画像が見つかりません</p>
        )}
      </div>
    </>
  )
}
