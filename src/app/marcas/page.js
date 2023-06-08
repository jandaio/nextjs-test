import ListaMarcas from "../clientComponents/listaMarcas"


async function getMarcas() {
    const cache = {};
    //{ cache: 'no-store' }

    const res = await fetch('http://localhost:3000/api/marcas', cache);

    if (!res.ok) throw new Error('Failed to fetch data');

    return res.json();
}

export default async function Page() {

    const data = await getMarcas();
    const marcas = data.response;

    return (
        <>
            <ListaMarcas data={marcas} />
        </>


    )

}

