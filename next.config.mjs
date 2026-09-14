// STEP: Next.js configuration.
// Keep this file small until we actually need custom framework behavior.
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,

  // Tell Next.js to generate a completely static website.
  // The result will be placed in the /out directory.
  output: "export",

  // Generate /about/index.html instead of /about.html.
  // This works better with static web servers such as S3.
  trailingSlash: true, // 👈 CRITICAL FOR S3 DEPLOYMENTS

  // Next/Image normally expects a Next.js server to optimize images.
  // Since we are removing the Next.js server, disable that optimization.
  images: {
    unoptimized: true,
  },
};

export default nextConfig;
