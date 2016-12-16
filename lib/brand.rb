class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:upcase)

  private

    define_method(:upcase) do
      self.name = name.capitalize
    end

end
