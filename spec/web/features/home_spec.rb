# spec/web/features/visit_home_spec.rb
require 'features_helper'

RSpec.describe 'Visit home' do
  before do
    Restaurant.push({:name=>"Top Pizza 2"}.to_json)
    Dish.push({:title=>"Fish & Chips"}.to_json)
  end

  it 'is successful' do
    visit '/'
    expect(page).to have_content("Top Pizza 2")
    expect(page).to have_content("Fish & Chips")
    expect(page).to have_content('Overview')
  end
end
