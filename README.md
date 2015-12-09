How would you return all the recipes in your database?
```
Recipe.find_each do |recipe|
  puts recipe.title  
end  
```

How would you return all the comments in your database?
```
Comment.find_each do |comment|
  puts comment.comment
end  
```
How would you return the most recent recipe posted in your database?
```
Recipe.last
```
How would you return all the comments of the most recent recipe in your database?
```
Comment.find_by_recipe_id(5)
```

How would you return the most recent comment of all your comments?
```
Comment.last
```

How would you return the recipe associated with the most recent comment in your database?
```
Recipe.find(Comment.last.recipe_id)
```
How would you return all comments that include the string brussels in them?
```
Comment.where("comment LIKE '%Brussels%'").each do |comment|
  puts comment
end
```
-------
Validate that the title of each recipe exists.
```
validates :title, presence: true
```
Validate that the title of each recipe is unique.
```
uniqueness: true
```
Validate that the title of each recipe contains "Brussels sprouts" in it.
```
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
  validates_with BrusselsValidator, fields: [:title]
end

```
Validate that the length of a comment be a maximum of 140 characters long.
```
 validates :comment, length: { maximum: 140 }
```
Validate that a comment has a recipe.
```
 validates :recipe_id, presence: true
```
Add a field servings to your Recipe table. This field is optional, but if supplied, it must be greater than or equal to 1. Write a validation for this.
```
validates :servings, numericality: { only_integer: true, greater_than: 0 }
```
Load up your app in irb and comfirm that your validations work.
