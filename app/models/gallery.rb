class Gallery < ActiveRecord::Base
  belongs_to :service
  belongs_to :category

  mount_uploader :photo, PhotoUploader

  attr_accessible :for_big_slider, :for_small_slider, :category_id, :service_id, :photo,
                  :crop_x, :crop_y, :crop_w, :crop_h, :title, :description, :en_title, :en_description
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  scope :for_background, where(:for_big_slider => true)
  scope :for_slider, where(:for_small_slider => true)

  after_update :crop_photo

  # validates :title, :length => { :minimum => 1, :maximum => 25 }
  # validates :description, :length => { :minimum => 1, :maximum => 25 }
  # validates :en_title, :length => { :minimum => 1, :maximum => 25 }
  # validates :en_description, :length => { :minimum => 1, :maximum => 25 }

  def crop_photo
    photo.recreate_versions! if crop_x.present?
  end
end
