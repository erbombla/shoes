require('spec_helper')

describe Store do
  describe ('#validation') do
    it('validates presence of description') do
      store = Store.new({:name => ""})
      expect(store.save).to(eq(false))
    end
  end

  describe ('#brands') do
    it('adds brands to a store') do
      store = Store.create({:name => "Boot Company"})
      brand = Brand.create({:name => "Chippewa"})
      store.brands.push(brand)
      expect(store.brands).to(eq([brand]))
    end
  end
end
