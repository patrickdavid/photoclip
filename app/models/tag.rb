class Tag < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :photo_id
end
