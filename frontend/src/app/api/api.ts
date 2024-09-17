import { User } from "@/types/types"
import * as common from "@/utility/common"

export const getUser = async (id: String): Promise<User> => {
    let url = common.isDev();
    const res = await fetch(`${url}/api/login`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({id}),
        cache: 'no-store'
    });
    const userArr = await res.json();
    return userArr;
} 