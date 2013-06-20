class Gallery < ActiveRecord::Base
  belongs_to :service

  has_attached_file :photo,
                    :styles => { :small => "60x60>",
                                 :block1 => "250x200>",
                                 :block2 => "330x250>",
                                 :normal => "700x700>" },
                    :url  => "/images/gallery/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/gallery/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo,
                                    :content_type => ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']

  attr_accessible :for_big_slider, :for_small_slider, :service_id, :photo
end
