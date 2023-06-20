import { NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma'
import { Prisma } from '@prisma/client'

export async function POST(req: Request) {
    if (req.method === 'POST') {
        try {

            const data = await req.json();
            console.log(data);

            await prisma.iconos.create({
                data: {
                    titulo_es: data.titulo_es,
                    titulo_en: data.titulo_en,
                    imagen: data.imagen,
                    imagen_hd: data.imagen_hd,
                    imagen_ultra: data.imagen_ultra,
                    orden: parseInt(data.orden),
                    created: new Date(),
                    modified: new Date(),
                },
            });

            NextResponse.json({ data }, { status: 200 });
        } catch (error) {
            console.error('Error creating iconos:', error);
            NextResponse.json({ error: 'Error creating iconos' }, { status: 500 });
        }
    } else {
        NextResponse.json({ error: 'Method Not Allowed' }, { status: 500 });
    }
}