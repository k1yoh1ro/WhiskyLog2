'use client';

import React, { useState } from "react";
import { insertWhiskeyData } from "@/app/api/api";

export default function downloadImagePage() {
    const [file, setFile] = useState<File | null>(null);
    const [name, setName] = useState<string>("");
    const [whiskeyId, setWhiskeyId] = useState<number>(0);
    const [status, setStatus] = useState<string>("");

    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files.length > 0) {
            setFile(e.target.files[0]);
        }
    };

    return (
        <div>
            <h1>Download Whiskey Image</h1>
        </div>
    );
}
