class Member < ActiveRecord::Base
  attr_accessible :address, :birth_date, :contact_phone, :email, :last_name, :name, :picture, :picture_thumbnail
end
