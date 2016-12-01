class MakeNotificationsDefaultStatus < ActiveRecord::Migration[5.0]
  def up
    change_column_default :notifications, :status, 0
  end

  def down
    change_column_default :notifications, :status, nil
  end
end
