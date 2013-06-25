class AddTitleAndDescriptionToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :title, :string
    add_column :galleries, :description, :string
  end
end
