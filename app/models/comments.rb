class Comment < ActiveRecord::Base
  belongs_to :recipe
  validates :comment, length: { maximum: 140 }
  validates :recipe_id, presence: true
end
