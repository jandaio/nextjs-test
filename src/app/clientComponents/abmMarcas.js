'use client';
import 'bootstrap/dist/css/bootstrap.min.css';
import Link from 'next/link'
import Image from 'next/image'
import Accordion from 'react-bootstrap/Accordion';
import Button from 'react-bootstrap/Button';
import { Nav } from 'react-bootstrap';
import { useRouter } from 'next/router';

const IMAGEURL = "https://www.marlew.com.ar/images/";
const IMAGEMARCASURL = IMAGEURL + "marcas/";

export default function AbmMarcas(props) {
    const router = useRouter();
    let marcas = props.data;
    let keysMarcas = Object.keys(marcas);

    let items = keysMarcas.map(key =>
        <Accordion.Item eventKey={marcas[key].key} key={marcas[key].key} >
            <Accordion.Header>{marcas[key].line1[0]}
                <Nav className="ml-auto">
                    <Nav.Link href={"/marcas/edit/" + marcas[key].key}>Edit
                    </Nav.Link>

                    <Nav.Link href={"/marcas/remove/" + marcas[key].key}>remove
                    </Nav.Link>
                </Nav>
            </Accordion.Header>
            <Accordion.Body>
                <Image src={IMAGEMARCASURL + marcas[key].image.black} alt={marcas[key].line1[0]} width={942 / 3} height={
                    200 / 3}></Image >
            </Accordion.Body>
        </Accordion.Item>
    )


    return (<>

        <Link href="/marcas/add">
            <Button variant="primary">Agregar</Button>
        </Link>
        <h4>{router.query.action}</h4>
        <Accordion>{items}</Accordion>
    </>
    )
}