class CreateUsers < ActiveRecord::Migration[5.0]
  self.primary_key = 'username'
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
