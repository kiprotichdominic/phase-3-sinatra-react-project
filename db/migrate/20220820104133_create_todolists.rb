class CreateTodolists < ActiveRecord::Migration[6.1]
  def change
    create_table :todolists do |t|
      t.integer :todo_id
      t.string :text
      t.string :color
      t.timestamps null: false
    end
  end
end
