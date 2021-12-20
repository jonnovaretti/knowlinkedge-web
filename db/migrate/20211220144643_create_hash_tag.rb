class CreateHashTag < ActiveRecord::Migration[6.1]
  def change
    create_table :hash_tags do |t|
      t.string :name
      t.string :area

      t.timestamps
    end
  end
end
