class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :study, null: false, foreign_key: true
      t.references :material, null: true, foreign_key: false
      t.integer :author_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
