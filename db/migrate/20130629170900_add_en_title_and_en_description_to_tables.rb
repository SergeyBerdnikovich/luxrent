class AddEnTitleAndEnDescriptionToTables < ActiveRecord::Migration
  def change
    add_column :categories, :en_title, :string
    add_column :categories, :en_description, :string

    add_column :services, :en_title, :string
    add_column :services, :en_description, :string

    add_column :prices, :en_title, :string

    add_column :galleries, :en_title, :string
    add_column :galleries, :en_description, :string

    add_column :phrases, :en_title, :string
    add_column :phrases, :en_description, :string
  end
end
