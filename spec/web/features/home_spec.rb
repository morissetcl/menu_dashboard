# spec/web/features/visit_home_spec.rb
require 'features_helper'

RSpec.describe 'Visit home' do
  before do
    Restaurant.push({:name=>"Top Pizza 2"}.to_json)
    Dish.push({:title=>"Fish & Chips"}.to_json)
    store = PStore.new("accounting.pstore")
    store.transaction do
      store[:dish_count] = 23
      store[:restaurant_count] = 98
      store.commit
    end
  end

  it 'is successful' do
    visit '/'
    expect(page).to have_content("Top Pizza 2")
    expect(page).to have_content("Fish & Chips")
    expect(page).to have_content('Dishes : 23')
    expect(page).to have_content('Restaurants : 98')
  end
end
