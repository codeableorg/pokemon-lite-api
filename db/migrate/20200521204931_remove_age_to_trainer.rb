class RemoveAgeToTrainer < ActiveRecord::Migration[6.0]
  change_table :trainers do |t|
    t.remove :age
    t.rename :status, :team_member
  end
end
