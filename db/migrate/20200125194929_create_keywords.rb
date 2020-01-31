class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.references :idea, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
