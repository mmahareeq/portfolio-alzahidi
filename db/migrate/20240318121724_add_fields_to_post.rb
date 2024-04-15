class AddFieldsToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :title_ar, :string
    add_column :posts, :title_en, :string
  end
end
