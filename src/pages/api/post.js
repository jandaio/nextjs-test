import { prisma } from '@/lib/prisma'
import { Prisma } from '@prisma/client'

export default async function handler(req, res) {
    if (req.method === 'POST') {
        try {
            const data = req.body
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

            res.status(200).json(data)
        } catch (error) {
            console.error('Error creating iconos:', error);
            res.status(500).json({ error: 'Error creating iconos' })
        }
    } else {
        res.status(500).json({ error: 'Method Not Allowed' })

    }
}