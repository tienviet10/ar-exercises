class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_men_or_women_apparel

  before_destroy :validate_employees

  private

  def must_carry_men_or_women_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:store, "Store must carry at least a men's or women's apparel")
    end
  end

  def validate_employees
    if employees.any?
      errors.add(:base, "Cannot delete store with employees")
      throw :abort
    end
  end

end
