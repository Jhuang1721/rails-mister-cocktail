class Dose < ApplicationRecord
  attr_accessor :description_amount, :description_unit
  before_save :full_description

  def full_description
    self.description = "#{self.description_amount} #{self.description_unit}"
  end

  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail_id, :uniqueness => {:scope => :ingredient_id}
end
