require 'test_helper'
class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(name: "Nadia", email: "nadia@example.com", password: "password", password_confirmation: "password")
    @recipe = @chef.recipes.build(name: "Lasagna", description: "Great Ladagna recipe!")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description shouldn't be less then 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

  test "description shouldn't be more then 500 characters" do
    @recipe.description = "a" * 510
    assert_not @recipe.valid?
  end
end
