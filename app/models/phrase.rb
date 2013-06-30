class Phrase < ActiveRecord::Base
  attr_accessible :description, :title, :en_title, :en_description
end
