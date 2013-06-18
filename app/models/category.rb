class Category < ActiveRecord::Base
  attr_accessible :description, :separately, :title
  has_many :services
end
