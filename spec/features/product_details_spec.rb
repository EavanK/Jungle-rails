require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

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
  
  scenario "They click product details button" do
    visit root_path

    click_link('Details')

    expect(page).to have_css 'article.product-detail'
    # save_and_open_page
    # save_screenshot
  end
end
