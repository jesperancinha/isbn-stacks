describe('Kofu testing', () => {

    const host = Cypress.env('isbn-stacks-kofu') ? Cypress.env('isbn-stacks-kofu') : 'localhost';
    const port = Cypress.env('isbn-stacks-kofu_port') ? Cypress.env('isbn-stacks-kofu_port') : '8080';

    it('should return hello', () => {
        cy.request(`http://${host}:${port}/api/kofu/hello`).then(response => {
            expect(response.body).to.be.eq("I will now give you 1.000.000 ISBN numbers in a Spring KoFu Reactive way")
        })
    })
    it('should return hello JSON', () => {
        cy.request(`http://${host}:${port}/api/kofu`).then(response => {
            expect(response.body.message).to.be.eq("I will now give you 1.000.000 ISBN numbers in a Spring KoFu Reactive way")
        })
    })
    it('should generate 50 ISBNS', () => {
        cy.request({
            method: "GET",
            url: `http://${host}:${port}/api/kofu/small/isbns`,
            timeout: 60000
        }).then(response => {
            expect(response.body.length).to.be.eq(50)
        })
    })
})