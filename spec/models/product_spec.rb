require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do

    before do
      @category = Category.create!(:name => 'Furniture')
      @product = Product.new(:name => 'Coffee Table', :price => 20, :quantity => 40, :category => @category)
    end

    it "should save successfully" do
      expect(@product.save).to be true
      expect(@product.errors.full_messages).to eql([])
      expect(@product.name).to eql('Coffee Table')
      expect(@product.price).to eql(20)
      expect(@product.quantity).to eql(40)
      expect(@product.category.name).to eql('Furniture')
    end

    # validation of name
    context "of name" do
      it "should return an error message if name is not given" do
        @product.name = nil

        expect(@product.save).to be false
        expect(@product.errors.full_messages).to eql(["Name can't be blank"])
      end
    end

    # validation of price
    context "of price" do
      it "should return an error message if price is not given" do
        @product = Product.new(:name => 'Coffee Table', :quantity => 40, :category => @category)

        expect(@product.save).to be false
        expect(@product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
      end
    end

    # validation of quantity
    context "of quantity" do
      it "should return an error message if quantity is not given" do
        @product.quantity = nil

        expect(@product.save).to be false
        expect(@product.errors.full_messages).to eql(["Quantity can't be blank"])
      end
    end

    # validation of category
    context "of category" do
      it "should return an error message if category is not given" do
        @product.category = nil
        
        expect(@product.save).to be false
        expect(@product.errors.full_messages).to eql(["Category can't be blank"])
      end
    end
  end  
end