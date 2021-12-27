class CreateMaterialReference < ActiveRecord::Migration[6.1]
  def change
    create_table :material_references do |t|
      t.references :reference, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
    end
  end
end
