const axios = require('axios');
const { expect } = require('chai');


describe('POST Request', () => {
    it('should send a POST request successfully', async () => {
        try {
            const response = await axios.post('http://localhost:3000/api/post', {
                titulo_es: 'algo',
                titulo_en: 'claro',
                imagen: 'test',
                imagen_hd: 'si',
                imagen_ultra: 'test',
                orden: 5
            });

            // Assert the response status
            expect(response.status).to.equal(200);

            // Assert the response data or any other desired assertions
            //expect(response.data).to.have.property('message').that.includes('success');

        } catch (error) {
            throw new Error(error.response.data);
        }


    });
});

