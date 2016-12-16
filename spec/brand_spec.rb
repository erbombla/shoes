require('spec_helper')

describe Brand do
  describe ('#validation') do
    it('validates presence of description') do
      brand = Brand.new({:name => ""})
      expect(brand.save).to(eq(false))
    end
  end
end
