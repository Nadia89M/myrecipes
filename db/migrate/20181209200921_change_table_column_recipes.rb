class ChangeTableColumnRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :image, :string
  end
end
