require('spec_helper')

describe Brand do
  describe ('#validation') do
    it('validates presence of description') do
      brand = Brand.new({:name => ""})
      expect(brand.save).to(eq(false))
    end
  end

  describe('#upcase') do
    it('saves brands with a capital letter') do
      brand = Brand.create({:name => "chippewa"})
      expect(brand.name).to(eq("Chippewa"))
    end
  end 
end
