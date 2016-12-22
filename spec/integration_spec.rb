require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before() do
  store = Store.create({:name => 'Footlocker'})
  brand = Brand.create({:name => 'Nike'})
end

describe('view stores') do
  it('shows a list of all stores', {:type => :feature}) do
    visit('/')
    expect(page).to have_content("Company Name Main Portal Store Information Brand Information")
  end
end

describe('add a new store to list') do
  it('adds as store to the list', {:type => :feature}) do
    visit('/store_info')
    fill_in('name_input', :with => 'Footlocker')
    click_button('Add')
    expect(page).to have_content('Footlocker')
  end
end

describe('Add brand to a store', {:type => :feature}) do
  it('allows user to add a brand to a store') do
    visit('/brand_info')
    fill_in('name_input', :with => 'Adidas')
    click_button('Add')
    expect(page).to have_content('Adidas')
  end
end

describe('Edit brand') do
  it('edits a brand name', {:type => :feature}) do
    visit('/brand_info')
    click_link('Nike')
    fill_in('new_name', :with => 'Adidas')
    click_button('Update')
    expect(page).to have_content('Adidas')
  end
end
