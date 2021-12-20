class CreateHashTagStudy < ActiveRecord::Migration[6.1]
  def change
    create_table :hash_tag_studies, id: false do |t|
      t.references :study, null: false, foreign_key: true
      t.references :hash_tag, null: false, foreign_key: true
    end
  end
end
