'use client';

import React from 'react';
import { FloatingLabel, Form, Button, Container, Row, Col } from 'react-bootstrap';
import { useForm } from 'react-hook-form';
import * as yup from 'yup';

// interface IconosFormData {
//   titulo_es: string;
//   titulo_en: string;
//   imagen: string;
//   imagen_hd: string;
//   imagen_ultra: string;
//   orden?: number;
// }

export default async function Page() {



  const { register, handleSubmit, formState: { errors } } = useForm();

  const onSubmit = async (data, e) => {
    e.preventDefault();
    console.log("SUMITEO")


    try {
      const response = await fetch('/api/iconos/add', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });

    } catch (error) {
      console.error('Error:', error);
    }
  };

  return (
    <Container>
      <Row>
        <Col>
          <Form onSubmit={handleSubmit(onSubmit)}>
            <FloatingLabel controlId="titulo_es" label="Título en Español" className="mb-3">
              <Form.Control type="text" {...register('titulo_es')} />

            </FloatingLabel>

            <FloatingLabel controlId="titulo_en" label="Título en Inglés" className="mb-3">
              <Form.Control type="text" {...register('titulo_en')} />

            </FloatingLabel>

            <FloatingLabel controlId="imagen" label="URL de la Imagen" className="mb-3">
              <Form.Control type="text" {...register('imagen')} />

            </FloatingLabel>

            <FloatingLabel controlId="imagen_hd" label="URL de la Imagen HD" className="mb-3">
              <Form.Control type="text" {...register('imagen_hd')} />
              {errors.imagen_hd && <Form.Text className="text-danger">{errors.imagen_hd.message}</Form.Text>}
            </FloatingLabel>

            <FloatingLabel controlId="imagen_ultra" label="URL de la Imagen Ultra" className="mb-3">
              <Form.Control type="text" {...register('imagen_ultra')} />

            </FloatingLabel>

            <FloatingLabel controlId="orden" label="Orden (opcional)" className="mb-3">
              <Form.Control type="number" {...register('orden')} />

            </FloatingLabel>

            <Button variant="primary" type="submit">
              Enviar
            </Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
}
