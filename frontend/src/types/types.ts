export interface User {
    id: string
    password: string
    username: string
    mailaddress: string
}

export interface WhiskeyImage {
    whiskeyId: number;
    name: string;
    imageData: Blob;
}

export interface Whiskeys {
    name: string;
    country: string;
    type: string;
    alcoVol: string;
    price: string;
    rate1: string;
    rate2: string;
    rate3: string;
    rate4: string;
    rate5: string;
    createdAt: Date;
}

export interface WhiskeyFormData {
    whiskeyId: string;
    name: string;
    country: string;
    type: string;
    alcoVol: string;
    price: string;
    image: File | null;
}
