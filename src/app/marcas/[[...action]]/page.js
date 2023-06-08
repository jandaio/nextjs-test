import AbmMarcas from "../../clientComponents/abmMarcas"


async function getMarcas() {
    const cache = {};
    //{ cache: 'no-store' }

    const res = await fetch('https://www.marlew.com.ar/api/queries/getBrands.json', cache);

    if (!res.ok) throw new Error('Failed to fetch data');

    return res.json();
}

export default async function Page() {

    const data = await getMarcas();
    const marcas = data.response;

    return (
        <>
            <h3>Marcas:</h3>

            <AbmMarcas data={marcas} />
        </>


    )

}

