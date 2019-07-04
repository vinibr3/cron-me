class CreateLabelPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :label_posts do |t|
      t.references :label, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
