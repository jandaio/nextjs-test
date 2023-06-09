'use client';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Navbar, Nav } from 'react-bootstrap';

export default function MainMenu() {
  return (
    <Navbar bg="light" expand="lg" >
      <Navbar.Brand href="/" className="p-3">Backoffice Marlew Web</Navbar.Brand>
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav">
        <Nav className="ml-auto">
          <Nav.Link href="/iconos">Iconos</Nav.Link>
        </Nav>
      </Navbar.Collapse>
    </Navbar>)
} 
