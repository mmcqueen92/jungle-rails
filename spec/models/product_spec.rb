require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

      it 'should save when all required fields are filled' do
        @category = Category.new
        @product = Product.new({
          name: "new plant",
          price: 100,
          quantity: 5,
          category: @category
        })
        @product.save!
        expect(@product).to be_valid
    end

    it 'should have a name error' do
      @category = Category.new
      @product = Product.new({
        price: 100,
        quantity: 5,
        category: @category
      })
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price error' do
      @category = Category.new
      @product = Product.new({
        name: "new plant",
        quantity: 5,
        category: @category
      })
      @product.save
      expect(@product.errors.full_messages).to include("Price cents is not a number")
    end

    it 'should have a quantity error' do
      @category = Category.new
      @product = Product.new({
        name: "new plant",
        price: 100,
        category: @category
      })
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category error' do
      @category = Category.new
      @product = Product.new({
        name: "new plant",
        price: 100,
        quantity: 5
      })
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end