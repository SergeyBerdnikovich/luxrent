class Setting < ActiveRecord::Base
  attr_accessible :content, :en_content, :title

  validates :title, :presence => true
end
