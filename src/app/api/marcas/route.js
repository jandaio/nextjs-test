
import { NextResponse } from 'next/server';

export async function GET() {
    const res = await fetch('https://www.marlew.com.ar/api/queries/getBrands.json');

    if (!res.ok) return NextResponse.json({ response: "error}" });

    const data = await res.json();

    return NextResponse.json(data);
}
