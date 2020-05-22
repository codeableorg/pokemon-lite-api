class ChangeTeamMemberOnTrainers < ActiveRecord::Migration[6.0]
  def up
    change_column :trainers, :team_member, 'boolean USING CAST(team_member AS boolean)'
  end

  def down
    change_column :trainers, :team_member, :string
  end
end
