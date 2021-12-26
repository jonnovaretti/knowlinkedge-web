class CreateMaterial < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.references :study, null: false, foreign_key: true

      t.timestamps
    end
  end
end
