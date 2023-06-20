import Listado from "@/app/clientComponents/listado"
import { prisma } from '@/lib/prisma'

function getIconos() {
    return prisma.iconos.findMany();
}


export default async function Page() {
    const iconos = await getIconos()

    return (<Listado title= "Iconos" data = { iconos } fields = {{ caption: "titulo_es", key: "id" }
} routeFolder = "iconos" />)

}

