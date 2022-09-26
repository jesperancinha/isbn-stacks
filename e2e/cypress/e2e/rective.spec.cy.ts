describe('Servlet testing', () => {

    const host = Cypress.env('isbn-stacks-reactive') ? Cypress.env('isbn-stacks-reactive') : 'localhost';
    const port = Cypress.env('isbn-stacks-reactive_port') ? Cypress.env('isbn-stacks-reactive_port') : '8081';

    it('should return hello', () => {
        cy.request(`http://${host}:${port}/api/traditional/hello`).then(response => {
            expect(response.body).to.be.eq("I will now give you 1.000.000 ISBN numbers in a Spring MVC Reactive way")
        })
    })
    it('should return hello JSON', () => {
        cy.request(`http://${host}:${port}/api/traditional`).then(response => {
            expect(response.body.message).to.be.eq("I will now give you 1.000.000 ISBN numbers in a Spring MVC Reactive way")
        })
    })
    it('should generate 50 ISBNS', () => {
        cy.request({
            method: "GET",
            url: `http://${host}:${port}/api/traditional/small/isbns`,
            timeout: 60000
        }).then(response => {
            expect(response.body.length).to.be.eq(50)
        })
    })
})
