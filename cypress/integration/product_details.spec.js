describe('product details tests', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('Can select a product',()=>{
    cy.get('.products article').first().click();
    cy.get('.product-detail').should('be.visible');
  });

})