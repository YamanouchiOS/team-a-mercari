class RemoveIntroductionFromUsers < ActiveRecord::Migration[5.0]
  def change
      remove_column :users, :family_name, :string
      remove_column :users, :first_name, :string
      remove_column :users, :family_kana, :string
      remove_column :users, :first_kana, :string
      remove_column :users, :gender, :integer
      remove_column :users, :introduction, :text
  end
end
