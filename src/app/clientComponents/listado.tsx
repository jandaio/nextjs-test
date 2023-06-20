'use client';
import 'bootstrap/dist/css/bootstrap.min.css';
import Link from 'next/link'
import Button from 'react-bootstrap/Button';
import { Container, Col, Row } from 'react-bootstrap';

type prismaRow={
    [key: string]: any;
}
type ListadoProps = {
    data:object[];
    title: string;
    routeFolder: string;
    fields: {
        caption: string;
        key: string;
    };
}
export default function Listado({ data, title, routeFolder, fields }: ListadoProps) {

    let fieldCaption = fields.caption
    let fieldKey = fields.key

    let items = data.map((row:prismaRow) => 
    <Row key={row[fieldKey]} className="p-1">
        <Col lg={10}> {row[fieldCaption]} </Col>
        {/* <Col lg={1}>
            <Link href={routeFolder + "/edit/" + row[fieldKey]} className='p-2'>
                <Button variant="primary"> Edit </Button>
            </Link> </Col>
        <Col lg={1}> <Link href={routeFolder + "/remove/" + row[fieldKey]} className='p-2'>
            <Button variant="primary"> Remove </Button></Link>
        </Col> */}
    </Row>
    )

    return (<>
        <Container>
            <Row className="p-3" > <Col><h3>{title} </h3>
            </Col>
                < Col > <Link href={routeFolder + "/add/"} >
                    <Button variant="primary" > Agregar </Button>
                </Link>
                </Col>
            </Row>
            {items}
        </Container >
    </>
    )
}


