class AddMaterialTypeColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :type, :string
  end
end
