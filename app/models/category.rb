class Category < ActiveRecord::Base
  attr_accessible :description, :separately, :title
  has_and_belongs_to_many :services
  has_many :galleries
end
