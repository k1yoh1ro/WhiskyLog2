import { User } from "@/types/types"
import * as common from "@/utility/common"

export const getUser = async (id: String): Promise<User> => {
    let url = common.isDev();
    const res = await fetch(`${url}/api/login`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id }),
        cache: 'no-store'
    });
    const userArr = await res.json();
    return userArr;
};

export const uploadImage = async (whiskeyId: number, file: File): Promise<void> => {
    let url = common.isDev();
    const formData = new FormData();
    formData.append("whiskeyId", whiskeyId.toString());
    formData.append("name", file.name);
    formData.append("file", file);

    const response = await fetch(`${url}/api/image/upload`, {
        method: "POST",
        body: formData,
    });

    if (!response.ok) {
        throw new Error("Failed to upload image");
    }
};

export const downloadImages = async (): Promise<any[]> => {
    let url = common.isDev();
    const res = await fetch(`${url}/api/image/download`, {
        method: "GET",
        cache: "no-store"
    })
    if (!res.ok) {
        throw new Error("Failed to fetch image list");
    }
    const images = await res.json();
    return images;
}
