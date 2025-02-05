// /** @type {import('next').NextConfig} */
// const nextConfig = {};

// export default nextConfig;

/** @type {import('next').NextConfig} */
const path = require("path") // CommonJS
// import { resolve } from "path"; // ESModule
const nextConfig = {
  output: "standalone",
  reactStrictMode: true,
  swcMinify: true,
  webpack: config => {
    config.watchOptions = {
      poll: 1000,
      aggregateTimeout: 300
    }
    config.resolve.alias["@"] = path.resolve(__dirname, "src") // CommonJS
    // config.resolve.alias["@"] = resolve(__dirname, "src"); // ESModule
    return config
  }
}
module.exports = nextConfig // CommonJS
// export default nextConfig // ESModule