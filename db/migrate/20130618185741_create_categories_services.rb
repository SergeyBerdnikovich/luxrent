class CreateCategoriesServices < ActiveRecord::Migration
  def change
    create_table :categories_services do |t|
      t.references :category
      t.references :service
    end
    add_index :categories_services, :category_id
    add_index :categories_services, :service_id
  end
end
