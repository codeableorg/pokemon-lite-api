# frozen_string_literal: true

class ChangeColumnOnTrainer < ActiveRecord::Migration[6.0]
  def up
    change_column :trainers, :team_member_status, 'boolean USING CAST(team_member_status AS boolean)'
  end

  def down
    change_column :trainers, :team_member_status, :string
  end
end
