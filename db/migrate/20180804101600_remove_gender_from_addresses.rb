class RemoveGenderFromAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :gender, :integer
  end
end
