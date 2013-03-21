class AddPictureThumbnailToMembers < ActiveRecord::Migration
  def change
    add_column :members, :picture_thumbnail, :binary
  end
end

