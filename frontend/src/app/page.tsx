'use client'

import { test } from "@/app/api/api";
import { useEffect } from "react";

export default function Home() {
  let testString = "";

  useEffect(() => {
    async function fetchData() {
      try {
        const tmpStr = await test();
        testString = tmpStr;
      } catch (error) {

      }
    }

    fetchData();
  }, [])

  return (
    <>
      <div className="container">
        <div>{testString}</div>
        <div>testdddd</div>
      </div>
    </>
  )
}