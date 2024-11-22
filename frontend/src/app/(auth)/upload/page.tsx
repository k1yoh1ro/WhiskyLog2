'use client';

import React, { useState } from "react";
import { uploadImage } from "@/app/api/api";

export default function UploadImagePage() {
    const [file, setFile] = useState<File | null>(null);
    const [name, setName] = useState<string>("");
    const [whiskeyId, setWhiskeyId] = useState<number>(0);
    const [status, setStatus] = useState<string>("");

    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files.length > 0) {
            setFile(e.target.files[0]);
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!file || whiskeyId <= 0) {
            setStatus("Please provide all required fields.");
            return;
        }

        try {
            setStatus("Uploading...");
            await uploadImage(whiskeyId, file);
            setStatus("Image uploaded successfully!");
        } catch (error) {
            console.error(error);
            setStatus("Failed to upload image.");
        }
    };

    return (
        <div>
            <h1>Upload Whiskey Image</h1>
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    placeholder="Whiskey ID"
                    value={whiskeyId}
                    onChange={(e) => setWhiskeyId(Number(e.target.value))}
                />
                <input type="file" onChange={handleFileChange} />
                <button type="submit">Upload</button>
            </form>
            <p>{status}</p>
        </div>
    );
}
