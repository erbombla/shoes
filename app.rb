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

# get('store_form/:id') do
#   @current_store = Store.find(params[:id].to_i)
#   @current_store_brands = @current_store.brands
#   @all_brands = Brand.all
#   erb(:store_form)
# end
#
# get ('/brand_info') do
#   @all_brands = Brand.all()
#   erb(:brand_info)
# end
#
# patch ('/brands/create_brand') do
#   new_name = params.fetch('new_name')
#   @new_brand = Brand.create({name: new_name})
# end
#
# get ('brand_form/:id') do
#   @current_brand = Brand.find(params[:id].to_i)
#   erb(:brand_form)
# end
#
# post ('/brand_info/create_brand') do
#   name_input = params.fetch('name_input')
#   @new_brand = Brand.create({name: name_input})
#   if @new_brand.save
#     redirect('/brand_info')
#   end
# end
#
# delete('store_form/:id/delete') do
#   @current_store = Store.find(params[:id])
#   @current_store.destroy
#   redirect('/store_info')
# end
