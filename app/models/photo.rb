class Photo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id

  has_attached_file :photo, :styles => {:thumb => '100x100', :medium => '600x600>', :big => '1000x1000>'}

  validates_attachment :photo,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]},
    :size => { :in => 0..10000.kilobytes }


end
