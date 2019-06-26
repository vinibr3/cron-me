class ChangeActiveColumnFromBoard < ActiveRecord::Migration[5.2]
  def change
    change_column :boards, :active, :boolean, default: true
  end
end
