require 'rails_helper'

RSpec.feature "Visitor adds an item to cart", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can see the amount of items in their car in the header" do
    visit root_path

    expect(page).to have_css "article.product", count: 10

    within("#navbar") do 
      expect(page).to have_content("My Cart (0)")
    end

    save_screenshot

    find(".product .button_to .btn", match: :first).click

    within("#navbar") do 
      expect(page).to have_content("My Cart (1)")
    end

    save_screenshot
  end

end
