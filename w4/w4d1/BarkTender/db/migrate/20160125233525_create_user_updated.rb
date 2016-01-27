class CreateUserUpdated < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
