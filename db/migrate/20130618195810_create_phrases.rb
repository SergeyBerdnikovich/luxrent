class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
