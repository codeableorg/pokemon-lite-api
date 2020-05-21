class RemoveAgeFromTrainer < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainers, :age, :integer
  end
end
