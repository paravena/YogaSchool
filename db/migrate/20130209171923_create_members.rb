class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :last_name
      t.date :birth_date
      t.string :contact_phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
