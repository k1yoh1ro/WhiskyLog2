'use client'

import React, { useEffect, useState } from "react";
import { getUser } from "@/app/api/api";
import { useRouter } from 'next/navigation';


export default function Home() {
  const [formData, setFormData] = useState({ id: '', login_pass: '' });
  const [errorMessage, setErrorMessage] = useState('');
  const [isHidden, setIsHidden] = useState(false);
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if ((formData.id === "") || (formData.login_pass === "")) {
      setErrorMessage("※未入力の項目があります")
      setIsHidden(false)
      return
    } else {
      setIsHidden(true)
    }

    const userInfo = await getUser(formData.id)
    const now = new Date()

    if ((userInfo.id === "") || (userInfo.login_pass !== formData.login_pass)) {
      setErrorMessage("ユーザーが存在しないか、パスワードが間違っています。")
      setIsHidden(false)
    } else {
      //認証成功した際の処理
      setIsHidden(true)
      router.push('/top-page')

    }
  };

  return (
    <>
      <div className="container">
        <div className="row mx-0 text-center title-group">
          <div className="notification p-3">
            login your ID and password....
          </div>
          <div className={isHidden ? 'hidden' : 'visible'}>
            {errorMessage}
          </div>
        </div>
        <div className="row mx-0 p-5">
          <form className="flexbox mx-auto col-sm-5" onSubmit={handleSubmit}>
            <input
              className="input-text form-control mb-5 botder-3"
              type="text"
              value={formData.id}
              placeholder="ID"
              onChange={(e) => setFormData({ ...formData, id: e.target.value })}
              autoComplete="on"
            />
            <input
              className="input-text form-control mb-5 botder-3"
              type="password"
              value={formData.login_pass}
              placeholder="PASSWORD"
              onChange={(e) => setFormData({ ...formData, login_pass: e.target.value })}
              autoComplete="new-password"
            />
            <div className="button-group col-sm-5 text-centere mx-auto">
              <button
                className="login btn btn-primary btn-lg bg-priary"
                type="submit">
                login
              </button>
            </div>
          </form>
        </div>
      </div>
    </>
  )
}