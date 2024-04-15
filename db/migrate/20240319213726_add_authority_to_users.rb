class AddAuthorityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :authority, :string
  end
end
