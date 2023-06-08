"use client"
import MainMenu from "./clientComponents/mainMenu"
import { Container, Col, Row } from 'react-bootstrap';
export const metadata = {
  title: 'Test the next.js',
  description: 'Testeando next',
}


export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <Container>
          <Row>
            <Col><MainMenu></MainMenu></Col>
          </Row>
          <Row>
            <Col>
              {children}
            </Col>
          </Row>
        </Container>
      </body>
    </html>
  )
}
