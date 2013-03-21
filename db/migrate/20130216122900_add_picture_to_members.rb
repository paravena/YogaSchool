class AddPictureToMembers < ActiveRecord::Migration
  def change
    add_column :members, :picture, :binary
  end
end
