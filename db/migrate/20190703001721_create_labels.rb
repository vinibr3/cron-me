class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :title
      t.text :style

      t.timestamps
    end
  end
end
