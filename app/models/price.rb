class Price < ActiveRecord::Base
  attr_accessible :category_id, :cost, :service_id, :title, :en_title
  belongs_to :service
  belongs_to :category
end
