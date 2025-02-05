import { User, FormData } from "@/types/types"
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

export const insertWhiskeyData = async (data: FormData): Promise<void> => {
    let url = common.isDev();
    const res = await fetch(`${url}/api/put/whiskey-data`, {
        method: "POST",
        body: data as any, //なぜanyを使うのか
    });
    const ok = await res.json(); // JAVAからJSON形式で受け取らないとエラーになる。
    return ok
};

export const uploadImage = async (formData: FormData): Promise<void> => {
    let url = common.isDev();

    const res = await fetch(`${url}/api/image/upload`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
    });

    const ok = await res.json(); // JAVAからJSON形式で受け取らないとエラーになる。
    return ok
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

export const getTriedList = async (): Promise<any[]> => {
    let url = common.isDev();
    const res = await fetch(`${url}/api/triedList`, {
        method: "GET",
        cache: "no-store"
    })
    if (!res.ok) {
        throw new Error("Failed to fetch tried list");
    }
    const images = await res.json();
    return images;
}