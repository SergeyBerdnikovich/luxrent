class Category < ActiveRecord::Base
  attr_accessible :description, :separately, :title, :en_title, :en_description, :galleries_attributes
  has_and_belongs_to_many :services
  has_many :galleries
  has_many :prices

  accepts_nested_attributes_for :galleries
end
