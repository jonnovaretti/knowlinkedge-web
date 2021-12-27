class AddMaterialTypeColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :material_type, :string
  end
end
