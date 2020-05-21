class ChangeColumnTeamMemberOnTrainer < ActiveRecord::Migration[6.0]
  def change
    change_column :trainers, :team_member, 'boolean USING CAST (team_member AS boolean)'
  end
end
