class RemoveAgetoTrainer < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainers, :age
  end
end
