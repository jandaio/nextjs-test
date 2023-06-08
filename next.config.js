/** @type {import('next').NextConfig} */
const nextConfig = {
    experimental: {
        serverActions: true,
    },
    images: {
        remotePatterns: [
            {
                protocol: 'https',
                hostname: 'www.marlew.com.ar',
                port: '',
                pathname: '/images/**',
            },
        ],
    },
};

module.exports = nextConfig
