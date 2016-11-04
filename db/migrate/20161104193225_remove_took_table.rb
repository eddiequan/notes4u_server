class RemoveTookTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :tooks
  end
end
