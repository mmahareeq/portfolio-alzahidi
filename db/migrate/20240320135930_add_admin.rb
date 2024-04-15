class AddAdmin < ActiveRecord::Migration[7.1]
  def change
    User.create! do |u|
      u.email = 'admin@gmail.com'
      u.password = '123456'
      u.authority = 'admin'
    end
  end
end
