class CreateCat < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description
      t.timestamps
    end
    add_index :cats, :name
    add_index :cats, :color
    add_index :cats, :sex
    add_index :cats, :birth_date
  end
end
