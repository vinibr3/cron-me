class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.text :style
      t.boolean :active
      t.string :title, default: ''
      t.text :description
      t.integer :priority, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
