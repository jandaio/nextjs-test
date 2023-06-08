'use client';
import { Container, Col, Row } from 'react-bootstrap';
import { useParams } from 'next/navigation'

export default function Page() {
    const params = useParams()
    let marca = params.id;

    return (
        <>
            <Container>
                <Row className="p-3">
                    <Col>
                        <h3>Marca/Editar/{marca}</h3>
                    </Col>
                </Row>

            </Container >
        </>


    )

}

