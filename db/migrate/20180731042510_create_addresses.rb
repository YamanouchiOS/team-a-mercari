class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.user_id :references, unique: true, null: false, foreign_key: true
      t.postal_code :integer, null: false, add_index: true
      t.prefecture :integer,null: false
      t.city :string, null: false
      t.street_number, :string, null: false
      t.building_number, :string, null: false
      t.phone_number, :string, unique: true, null: false
      t.timestamps null: false
    end
  end
end

# prefectureはenum型で選択肢を保持
# ○○市××町までユーザーに入力してもらう→Cityカラムに格納
# １−１−１までユーザーに入力してもらう→street_numberに格納
