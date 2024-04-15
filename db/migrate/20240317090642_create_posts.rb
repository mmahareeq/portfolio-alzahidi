class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
