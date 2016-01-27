class UpdateUser < ActiveRecord::Migration
  def change
    drop_table :users
    # remove_column :users, :email, :string
    # remove_column :email
    # rename_column :users, :name, :username, uniqueness: true, presence: true


  end
end
