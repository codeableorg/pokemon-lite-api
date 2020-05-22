# frozen_string_literal: true

class ChangeColumnsToTrainer < ActiveRecord::Migration[6.0]
  def change
    rename_column :trainers, :name, :t_name
    rename_column :trainers, :gender, :t_gender
    rename_column :trainers, :home_region, :t_region
    rename_column :trainers, :team_member_status, :t_team_member
  end
end
