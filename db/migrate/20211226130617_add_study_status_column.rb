class AddStudyStatusColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :status, :string
  end
end
