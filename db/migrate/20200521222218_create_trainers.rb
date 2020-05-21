class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :gender
      t.string :region
      t.boolean :team_member
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
