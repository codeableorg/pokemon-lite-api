class ChangeColumnStatusToBeBooleanOnTrainer < ActiveRecord::Migration[6.0]
  def change
    change_column :trainers, :status, "boolean USING status::boolean"
  end
end
