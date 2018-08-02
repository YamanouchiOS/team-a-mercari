class CreateLargeClasses < ActiveRecord::Migration
  def change
    create_table :large_classes do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
