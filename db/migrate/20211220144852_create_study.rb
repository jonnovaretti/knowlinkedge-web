class CreateStudy < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :brief
      t.string :area

      t.timestamps
    end
  end
end
