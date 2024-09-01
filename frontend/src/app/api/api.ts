import { User } from "@/types/types"
import * as common from "@/utility/common"

export const getUser = async (formData: {}): Promise<User> => {
    let url = common.isDev();
    const res = await fetch(`${url}/api/login`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
          },
          cache: 'no-store'
    });
    const userArr = await res.json();
    return userArr;
} 