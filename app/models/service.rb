class Service < ActiveRecord::Base
  attr_accessible :description, :title, :en_title, :en_description, :galleries_attributes, :categories_attributes, :prices_attributes, :category_ids
  has_and_belongs_to_many :categories
  has_many :galleries
  has_many :prices, :dependent => :destroy
  accepts_nested_attributes_for :galleries, :allow_destroy => true
  accepts_nested_attributes_for :categories, :allow_destroy => true
  accepts_nested_attributes_for :prices, :allow_destroy => true
end
