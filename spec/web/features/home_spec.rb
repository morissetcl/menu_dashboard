# spec/web/features/visit_home_spec.rb
require 'features_helper'

RSpec.describe 'Visit home' do
  before do
    Restaurant.push({:name=>"Top Pizza 2", :created_at => "2020-04-24T20:03:55.325Z"}.to_json)
    Dish.push({:title=>"Fish & Chips", :created_at => "2019-03-24T20:03:55.325Z"}.to_json)
  end

  it 'is successful' do
    visit '/'
    expect(page).to have_content("Top Pizza 2")
    expect(page).to have_content("Fish & Chips")
    expect(page).to have_content('Overview')
    expect(page).to have_content('24/03/2019')
  end
end
