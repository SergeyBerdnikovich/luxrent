class Service < ActiveRecord::Base
  attr_accessible :description, :title
  has_and_belongs_to_many :categories
  has_many :galleries

  def image(i, size = :original)
    if self.galleries[i]
      size == :original ? self.galleries[i].photo.url : self.galleries[i].photo.url(size)
    else
     '/assets/no_image.png'
    end
  end
end
