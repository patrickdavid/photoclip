class User < ActiveRecord::Base

  has_secure_password
  has_many :photos
  has_attached_file :avatar, :styles => {:thumb => '100x100', :croppable => '600x600>', :big => '1000x1000>'}



  validates_uniqueness_of :email
  validates_presence_of :email


  validates_attachment :avatar, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]},
    :size => { :in => 0..10000.kilobytes }
end
