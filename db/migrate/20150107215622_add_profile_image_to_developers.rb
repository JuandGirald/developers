class AddProfileImageToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :profile_image, :string
  end
end
