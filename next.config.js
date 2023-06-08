/** @type {import('next').NextConfig} */
const nextConfig = {
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
