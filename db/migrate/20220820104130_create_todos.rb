class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.string :description
      t.datetime :completed_at
      t.timestamps null: false
    end
  end
end
