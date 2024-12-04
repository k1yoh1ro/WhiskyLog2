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