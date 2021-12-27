class CreateReference < ActiveRecord::Migration[6.1]
  def change
    create_table :references do |t|
      t.string :authors
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
