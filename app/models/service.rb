class Service < ActiveRecord::Base
  attr_accessible :description, :title
  has_and_belongs_to_many :categories
  has_many :galleries
end
