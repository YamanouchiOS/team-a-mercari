class ChangeColumnNullToAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column_null :addresses, :family_name, :true
    change_column_null :addresses, :first_name, :true
    change_column_null :addresses, :family_kana, :true
    change_column_null :addresses, :first_kana, :true

    change_column :addresses, :postal_code, :string
  end
end
