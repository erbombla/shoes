class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  before_save(:upcase)

  private

    define_method(:upcase) do
      self.name = self.name.split.map(&:capitalize).join(" ")
    end

end
