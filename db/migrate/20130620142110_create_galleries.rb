class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.boolean :for_big_slider
      t.boolean :for_small_slider
      t.integer :service_id

      t.timestamps
    end
  end
end
