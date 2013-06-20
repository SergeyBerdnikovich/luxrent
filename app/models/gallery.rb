class Gallery < ActiveRecord::Base
  belongs_to :service

  has_attached_file :photo,
                    :styles => { :small => "50x50>",
                                 :for_gallery => "200x200>",
                                 :normal => "700x700>" },
                    :url  => "/images/gallery/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/gallery/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo,
                                    :content_type => ['photo/jpg', 'photo/jpeg', 'photo/gif', 'photo/png']

  attr_accessible :for_big_slider, :for_small_slider, :service_id, :photo
end
