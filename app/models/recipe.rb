class BrusselsValidator < ActiveModel::Validator
  def validate(record)
  Recipe.find_each do |recipe|
    if recipe.title["Brussels Sprout"]
      puts true
    end
  end
  end
end

class Recipe < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  validates :title, uniqueness: true
  validates_with BrusselsValidator, fields: [:title]
end

class Servings < ActiveRecord::Base
  validates :servings, numericality: { only_integer: true, greater_than: 0 }
end
