class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, unique: true, null: false, foreign_key: true
      t.integer :postal_code, null: false, add_index: true
      t.integer :prefecture,null: false
      t.string :city, null: false
      t.string :street_number, null: false
      t.string :building_number, null: false
      t.string :phone_number, unique: true, null: false
      t.timestamps
    end
  end
end

# prefectureはenum型で選択肢を保持
# ○○市××町までユーザーに入力してもらう→Cityカラムに格納
# １−１−１までユーザーに入力してもらう→street_numberに格納
