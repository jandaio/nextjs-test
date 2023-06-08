'use client';
import 'bootstrap/dist/css/bootstrap.min.css';
import Link from 'next/link'
import Image from 'next/image'
import Accordion from 'react-bootstrap/Accordion';
import Button from 'react-bootstrap/Button';
import { Container, Col, Row } from 'react-bootstrap';


const IMAGEURL = "https://www.marlew.com.ar/images/";
const IMAGEMARCASURL = IMAGEURL + "marcas/";

export default function ListaMarcas(props) {
    let marcas = props.data;
    let keysMarcas = Object.keys(marcas);

    let items = keysMarcas.map(key =>
        <Row key={key} className="p-2">
            <Col lg={10}>{marcas[key].line1[0]}</Col>
            <Col lg={1}>
                <Link href={"marcas/edit/" + marcas[key].key} className='p-2'>   <Button variant="primary">Edit</Button>
                </Link> </Col>
            <Col lg={1}><Link href={"marcas/remove/" + marcas[key].key} className='p-2'>
                <Button variant="primary">Remove</Button></Link>
            </Col>
        </Row>

    )

    return (<>
        <Container>
            <Row className="p-3"><Col><h3>Marcas</h3>
            </Col>
                <Col> <Link href="marcas/add/">
                    <Button variant="primary">Agregar</Button>
                </Link>
                </Col>
            </Row>
            {items}
        </Container >
    </>
    )
}