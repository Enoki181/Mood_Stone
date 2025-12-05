class CreateStones < ActiveRecord::Migration[8.1]
  def change
    create_table :stones do |t|
      t.string :name_ja, null: false
      t.string :name_en, null: false
      t.integer :min_mood, null: false
      t.integer :max_mood, null: false
      t.string :image_path
      t.text :description

      t.timestamps
    end
    add_index :stones, [:min_mood, :max_mood]
  end
end
