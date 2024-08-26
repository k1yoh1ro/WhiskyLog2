export const test = async () => {
    let url = "http://localhost/api";
    const res = await fetch(`${url}/login`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        },
        cache: 'no-store'
    });
    const testString = await res.json()
    return testString
}