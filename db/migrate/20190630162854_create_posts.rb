class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, default: ''
      t.text :description
      t.datetime :conclusion_date
      t.datetime :conclusion_deadline
      t.references :board

      t.timestamps
    end
  end
end
