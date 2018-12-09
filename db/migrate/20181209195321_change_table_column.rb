class ChangeTableColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :image, :text
  end
end
