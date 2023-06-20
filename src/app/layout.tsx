"use client"
import MainMenu from "@/app/clientComponents/mainMenu"
import { Container, Col, Row } from 'react-bootstrap';
import './globals.css'
import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Marlew Web Backoffice',
  description: 'Next.js test for marlew',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}> 
      <Container>
          <Row>
            <Col><MainMenu></MainMenu></Col>
          </Row>
          <Row>
            <Col>
              {children}
            </Col>
          </Row>
        </Container></body>
    </html>
  )
}



