class AddIntroductionToAddresses < ActiveRecord::Migration[5.0]
  def change
      add_column :addresses, :family_name, :string
      add_column :addresses, :first_name, :string
      add_column :addresses, :family_kana, :string
      add_column :addresses, :first_kana, :string
      add_column :addresses, :gender, :integer
      add_column :addresses, :introduction, :text
  end
end
