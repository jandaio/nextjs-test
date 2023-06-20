const axios = require('axios');
const { expect } = require('chai');

async function addIcon(iconData) {
    const url = 'http://localhost:3000/api/post';
    console.log("running POST");
    try {
        const response = await axios.post(url, iconData);
        expect(response.status).to.equal(200);
        console.log("FUNCIONO");
    } catch (error) {
        console.log("ERROR:")
        console.error(error);
    }
}


addIcon({
    titulo_es: 'algo',
    titulo_en: 'claro',
    imagen: 'test',
    imagen_hd: 'si',
    imagen_ultra: 'test',
    orden: 5
});
