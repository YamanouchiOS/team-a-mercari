class CreateMiddleClasses < ActiveRecord::Migration
  def change
    create_table :middle_classes do |t|
      t.string :name, null: false, unique: true
      t.references :large_class, null: false, foreign_key: true
      t.timestamps
    end
  end
end

