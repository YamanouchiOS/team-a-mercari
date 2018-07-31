class CreateLargeClasses < ActiveRecord::Migration
  def change
    create_table :large_classes do |t|
      t.name :string, null: false, unique: true
      t.timestamps null: false
    end
  end
end
