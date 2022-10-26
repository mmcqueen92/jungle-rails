describe('product details tests', () => {

  it('Visits the home page', () => {
    cy.visit('/')
  });

  it('Should select a product',()=>{
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
  });

})