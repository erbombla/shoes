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

post ('/stores/new_store') do
  name_input = params.fetch('name_input')
  @new_store = Store.create({name: name_input})
  if @new_store.save
    redirect('/store_info')
  end
end

get ('/brand_info') do
  @all_brands = Brand.all()
  erb(:brand_info)
end

post ('/brands/create_brand') do
  name_input = params.fetch('name_input')
  @new_brand = Brand.create({name: name_input})
  if @new_brand.save
    redirect('/brand_info')
  end
end

get ('/store_info/store/:id') do
  @current_store = Store.find(params[:id])
  @current_store_brands = @current_store.brands
  @all_brands = Brand.all
  erb(:store)
end

patch ('/add_brand/:id') do
  @current_store = Store.find(params[:id].to_i)
  added_brand = Brand.find(params[:added_brand])
  if @current_store.save
    @current_store.brands.push(added_brand)
    redirect("/store_info/store/#{@current_store.id}")
  end
end

get ('/brand_info/brand/:id') do
  @current_brand = Brand.find(params[:id])
  erb :brand
end

patch ('/brand/:id/update_name') do
  @current_brand = Brand.find(params[:id])
  @new_name = params.fetch('new_name')
  @current_brand.update({:name => @new_name})
  redirect ("/brand_info")
end
