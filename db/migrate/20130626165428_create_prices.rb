class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :title
      t.float :cost
      t.integer :service_id
      t.integer :category_id

      t.timestamps
    end
  end
end
