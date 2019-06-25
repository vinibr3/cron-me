class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_digest
      t.string :name, default: ''
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
