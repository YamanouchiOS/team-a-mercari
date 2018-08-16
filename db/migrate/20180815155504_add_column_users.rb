class AddColumnUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :image, :string
  end

  def down
    add_column :users, :image, :string
  end
end
