class RenameColumnTeamMemberStatusOnTrainer < ActiveRecord::Migration[6.0]
  def change
    rename_column :trainers, :team_member_status, :team_member
  end
end
