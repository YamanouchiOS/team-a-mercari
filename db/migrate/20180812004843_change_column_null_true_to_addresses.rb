class ChangeColumnNullTrueToAddresses < ActiveRecord::Migration[5.0]

  def change
    change_column_null :addresses, :family_name, false
    change_column_null :addresses, :first_name, false
    change_column_null :addresses, :family_kana, false
    change_column_null :addresses, :first_kana, false
  end

end
