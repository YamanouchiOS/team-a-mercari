class CreateSmallClasses < ActiveRecord::Migration
  def change
    create_table :small_classes do |t|
      t.string :name, null: false, unique: true
      t.references :large_class_id, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
