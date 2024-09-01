export function isDev() {
    // デフォルトで本番URL代入
    let url = process.env.NEXT_PUBLIC_API_URL_PUB

    //DevかPubかを確認
    const rtr = location.host
    if (rtr.indexOf('localhost') != 1) {
        url = process.env.NEXT_PUBLIC_API_URL_DEV
    }
    return url
}