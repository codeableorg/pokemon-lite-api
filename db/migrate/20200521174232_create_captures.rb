class CreateCaptures < ActiveRecord::Migration[6.0]
  def change
    create_table :captures do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :trainer, null: false, foreign_key: true

      t.integer :experience

      t.timestamps
    end
  end
end
