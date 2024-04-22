class AddImageToAdminBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_banners, :image, :string
  end
end
