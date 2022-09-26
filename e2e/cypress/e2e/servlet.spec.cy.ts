describe('Servlet testing', () => {

    const host = Cypress.env('isbn-stacks-mvc') ? Cypress.env('isbn-stacks-mvc') : 'localhost';
    const port = Cypress.env('isbn-stacks-mvc_port') ? Cypress.env('isbn-stacks-mvc_port') : '8082';

    it('should return hello', () => {
        cy.request(`http://${host}:${port}/api/traditional/non/hello`).then(response => {
            expect(response.body).to.be.eq("I will now give you 1.000.000 ISBN numbers in a Spring MVC Non-Reactive way")
        })
    })
    it('should return hello JSON', () => {
        cy.request(`http://${host}:${port}/api/traditional/non`).then(response => {
            expect(response.body.message).to.be.eq("I will now give you 1.000.000 ISBN numbers in a Spring MVC Non-Reactive way")
        })
    })
    it('should generate 50 ISBNS', () => {
        cy.request({
            method: "GET",
            url: `http://${host}:${port}/api/traditional/non/small/isbns`,
            timeout: 60000
        }).then(response => {
            expect(response.body.length).to.be.eq(50)
        })
    })
})