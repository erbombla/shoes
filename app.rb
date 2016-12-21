require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get ('/store_info') do
  @all_stores = Store.all()
  erb(:store_info)
end

post ('/store_info/new_store') do
  name_input = params.fetch('name_input')
  @new_store = Store.create({name: name_input})
  @new_store.save
  erb :store_info
end

get('store_info/store_form/:id') do
  @current_store = Store.find(params[:id].to_i)
  @current_store_brands = @current_store.brands
  @all_brands = Brand.all
  erb(:store_form)
end

get ('/brand_info') do
  @all_brands = Brand.all()
  erb(:brand_info)
end

post ('/brand_info/new_brand') do
  name_input = params.fetch('name_input')
  @new_brand = Brand.create({name: name_input})
end

get ('brand_info/brand_form/:id') do
  @current_brand = Brand.find(params[:id].to_i)
  erb(:brand_form)
end

delete('store_form/:id/delete') do
  @current_store = Store.find(params[:id])
  @current_store.destroy
  redirect('/store_info')
end
