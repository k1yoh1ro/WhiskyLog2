'use client';

import React, { useState } from "react";
import { insertWhiskeyData, uploadImage } from "@/app/api/api";
import { WhiskeyFormData } from "@/types/types";

export default function UploadImagePage() {
    // 型が混同している場合は、interfaceを作成してそこで型指定
    const [formData, setFormData] = useState<WhiskeyFormData>({
        name: '',
        country: '',
        type: '',
        alcoVol: '',
        price: '',
        image: null
    });
    const [status, setStatus] = useState<string>("");

    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files.length > 0) {
            // setFile(e.target.files[0]);
            setFormData({ ...formData, image: e.target.files[0] })
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        if (formData.name != undefined) {
            if (!formData.image) {
                setStatus("Please provide all required fields.");
                return;
            }
            try {
                setStatus("Uploading...");
                await insertWhiskeyData(formData);
                setStatus("Image uploaded successfully!");
            } catch (error) {
                console.error(error);
                setStatus("Failed to upload image.");
            }
        } else {
            setStatus("Please provide all required fields.");
            return;
        }

    };


    return (
        <div>
            <h1>Upload Whiskey Image</h1>
            <form onSubmit={handleSubmit}>
                <div className="flex">
                    <input
                        type="text"
                        placeholder="name"
                        defaultValue={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                    // onChange={(e) => addItems("name", e.target.value)}
                    />
                    <input
                        type="text"
                        placeholder="country"
                        defaultValue={formData.country}
                        onChange={(e) => setFormData({ ...formData, country: e.target.value })}
                    />
                    <input
                        type="text"
                        placeholder="type"
                        defaultValue={formData.type}
                        onChange={(e) => setFormData({ ...formData, type: e.target.value })}
                    />
                    <input
                        type="text"
                        placeholder="alcoVol"
                        defaultValue={formData.alcoVol}
                        onChange={(e) => setFormData({ ...formData, alcoVol: e.target.value })}
                    />
                    <input
                        type="text"
                        placeholder="price"
                        defaultValue={formData.price}
                        onChange={(e) => setFormData({ ...formData, price: e.target.value })}
                    />
                    <input type="file" onChange={handleFileChange} />
                    <button type="submit">Upload</button>
                </div>
            </form>
            <p>{status}</p>
        </div>
    );
}
