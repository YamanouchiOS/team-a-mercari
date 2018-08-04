require "csv"

CSV.foreach('db/csv/large_class.csv') do |row|
  LargeClass.create(name: row[0], created_at: Time.zone.now, updated_at: Time.zone.now)
end

CSV.foreach('db/csv/middle_class.csv') do |row|
  MiddleClass.create(name: row[0], large_class_id: row[1], created_at: Time.zone.now, updated_at: Time.zone.now)
end

CSV.foreach('db/csv/small_class.csv') do |row|
  SmallClass.create(name: row[0], middle_class_id: row[1], created_at: Time.zone.now, updated_at: Time.zone.now)
end
