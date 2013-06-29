class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :title
      t.string :content
      t.string :en_content

      t.timestamps
    end
  end
end
