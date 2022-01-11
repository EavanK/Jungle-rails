require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do

    before do
      @category = Category.create!(:name => 'Furniture')
      @product = Product.new(
        :name => 'Coffee Table',
        :price => 20,
        :quantity => 40,
        :category => @category
      )
    end

    it "should save successfully" do
      expect(@product.save).to be true
      expect(@product.errors.full_messages).to be_empty
      expect(@product).to have_attributes(
        :name => 'Coffee Table',
        :price => 20,
        :quantity => 40,
        :category => @category
      )
    end

    # validation of name
    context "of name" do
      it "should return an error message when name is blank" do
        @product.name = nil

        expect(@product.save).to be false
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    # validation of price
    context "of price" do
      it "should return an error message when price is blank" do
        @product = Product.new(:name => 'Coffee Table', :quantity => 40, :category => @category)

        expect(@product.save).to be false
        expect(@product.errors.full_messages).to include(
          "Price cents is not a number",
          "Price is not a number",
          "Price can't be blank"
        )
      end
    end

    # validation of quantity
    context "of quantity" do
      it "should return an error message when quantity is blank" do
        @product.quantity = nil

        expect(@product.save).to be false
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    # validation of category
    context "of category" do
      it "should return an error message when category is blank" do
        @product.category = nil
        
        expect(@product.save).to be false
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end  
end