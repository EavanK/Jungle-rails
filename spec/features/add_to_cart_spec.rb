require 'rails_helper'

RSpec.feature "Visitor adds a product into cart", type: :feature, js: true do


  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
    )
  end

  scenario "They click add button to place a product into cart" do
    visit root_path

    # save_screenshot # to check before clicking add button

    expect(page).to have_content 'My Cart (0)'

    find('form.button_to').click

    # save_screenshot # to check after clicking add botton

    expect(page).to have_content 'My Cart (1)'
  end
end
