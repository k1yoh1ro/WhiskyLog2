import { User, WhiskeyFormData } from "@/types/types"
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

export const insertWhiskeyData = async (data: WhiskeyFormData): Promise<number> => {
    let url = common.isDev();

    // FormData の作成 型エラーの回避
    // なぜ any を使わずに FormData を直接渡すとエラーが出るのか？
    // TypeScript の fetch API は body の型を string | FormData | Blob | BufferSource | URLSearchParams | ReadableStream<Uint8Array> のいずれかとして期待しています。
    // 一方で、WhiskeyFormData は単なるオブジェクト ({ key: value } の形) なので、そのまま渡すと FormData のオーバーロードと一致しません。
    // そのため、一度 FormData オブジェクトを作成し、それを fetch に渡すことでエラーを防ぐことができます。
    const formData = new FormData();
    formData.append("name", data.name);
    formData.append("country", data.country);
    formData.append("type", data.type);
    formData.append("alcoVol", data.alcoVol);
    formData.append("price", data.price);
    if (data.image) {
        formData.append("image", data.image);
    }

    const res = await fetch(`${url}/api/put/whiskey-data`, {
        method: "POST",
        body: formData
    });
    // 自動採番で登録されたIDを取得
    const ok = await res.json(); // JAVAからJSON形式で受け取らないとエラーになる。
    return ok;
};

export const uploadImage = async (regId: number, data: WhiskeyFormData): Promise<void> => {
    let url = common.isDev();

    const formData = new FormData();
    // FormData.appendは使用上、numberを直接渡せない?
    formData.append("whiskeyId", regId.toString());
    formData.append("name", data.name);
    if (data.image) {
        // Fileの場合、第三引数を指定しないといけない。ファイル名も正しく送信できる
        formData.append("image", data.image, data.image.name);
    }

    const res = await fetch(`${url}/api/image/upload`, {
        method: "POST",
        body: formData,
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