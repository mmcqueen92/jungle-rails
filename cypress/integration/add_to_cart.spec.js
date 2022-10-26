describe('add to cart tests', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('Confirms that cart count starts at 0', () => {
    cy.get("[href='/cart']").contains('My Cart (0)');
  })

  it('Can add a product to cart and increase the cart count by 1', () => {
    cy.get('.products article').first().find('button').click({force: true});
    cy.get("[href='/cart']").contains('My Cart (1)');
  })

});