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

User.create(id: 1, email: "nozomi@test.com", password: 12345678, nickname: "のぞみん", image: "http://www.lifetrivia.net/wp-content/uploads/2017/04/20170408-1-320x296.jpg")
User.create(id: 2, email: "suzu@test.com", password: 87654321, nickname: "すぅちゃん", image: "http://50秒ニュース.com/wp-content/uploads/2014/12/90.jpg")

Address.create(
  id: 1,
  user_id: 1,
  postal_code: "010-0951",
  prefecture: 4,
  city: "秋田市",
  street_number: "山王１丁目１",
  building_number: "",
  phone_number: "090-1234-5678",
  family_name: "佐々木",
  first_name: "希",
  family_kana: "ササキ",
  first_kana: "ノゾミ",
  introduction: "手作りのアクセサリーを出品しています。よろしくお願いします。"
  )

Address.create(
  id: 2,
  user_id: 2,
  postal_code: "424-0822",
  prefecture: 21,
  city: "静岡市",
  street_number: "清水区旭町６丁目８",
  building_number: "",
  phone_number: "090-8765-4321",
  family_name: "広瀬",
  first_name: "すず",
  family_kana: "ヒロセ",
  first_kana: "スズ",
  introduction: "初めまして。本を中心に出品しています。"
  )

Product.create(
  id: 1,
  name: "ソメス☆ハノーバー/２つ折入れ",
  detail: "コードバンのダークブラウンです。",
  price: 15000,
  condition: 1,
  delivery_cost: 0,
  prefecture: 4,
  delivery_date: 2,
  status: 0,
  user_id: 1
  )

Product.create(
  id: 2,
  name: "マザーハウス☆ハナビラ/ミズバショウ",
  detail: "マザーハウスのバッグです。新品です。",
  price: 20000,
  condition: 0,
  delivery_cost: 1,
  prefecture: 4,
  delivery_date: 0,
  status: 0,
  user_id: 1
  )

Product.create(
  id: 3,
  name: "シロ/練り香水",
  detail: "シロの練り香水です。香りはピオニーです。",
  price: 3000,
  condition: 2,
  delivery_cost: 0,
  prefecture: 4,
  delivery_date: 1,
  status: 0,
  user_id: 1
  )

Product.create(
  id: 4,
  name: "【未使用】Jill Lip Blossom",
  detail: "いただき物ですが色が合わないため出品します。",
  price: 3000,
  condition: 0,
  delivery_cost: 1,
  prefecture: 21,
  delivery_date: 2,
  status: 0,
  user_id: 2
  )

Product.create(
  id: 5,
  name: "【未使用】Jill Mix Blush Compact",
  detail: "いただき物ですが色が合わないため出品します。UVカットらしいです。",
  price: 3000,
  condition: 0,
  delivery_cost: 1,
  prefecture: 21,
  delivery_date: 2,
  status: 0,
  user_id: 2
  )

Product.create(
  id: 6,
  name: "【中古】キングダム",
  detail: "1巻から48巻まで。読み終わってしまったので出品します。",
  price: 15000,
  condition: 3,
  delivery_cost: 1,
  prefecture: 21,
  delivery_date: 2,
  status: 0,
  user_id: 2
  )

ProductImage.create(
  image: open("#{Rails.root}/db/images/img01.jpg"),
  status: 1,
  product_id: 1
  )

ProductImage.create(
  image: open("#{Rails.root}/db/images/img02.jpg"),
  status: 1,
  product_id: 2
  )

ProductImage.create(
  image: open("#{Rails.root}/db/images/img03.png"),
  status: 1,
  product_id: 3
  )

ProductImage.create(
  image: open("#{Rails.root}/db/images/img04.jpg"),
  status: 1,
  product_id: 4
  )

ProductImage.create(
  image: open("#{Rails.root}/db/images/img05.jpg"),
  status: 1,
  product_id: 5
  )

ProductImage.create(
  image: open("#{Rails.root}/db/images/img06.jpg"),
  status: 1,
  product_id: 6
  )

ProductCategory.create(
  product_id: 1,
  large_class_id: 2,
  middle_class_id: 23,
  small_class_id: 199
  )

ProductCategory.create(
  product_id: 2,
  large_class_id: 1,
  middle_class_id: 10,
  small_class_id: 74
  )

ProductCategory.create(
  product_id: 3,
  large_class_id: 7,
  middle_class_id: 77,
  small_class_id: 636
  )

ProductCategory.create(
  product_id: 4,
  large_class_id: 7,
  middle_class_id: 75,
  small_class_id: 614
  )

ProductCategory.create(
  product_id: 5,
  large_class_id: 7,
  middle_class_id: 75,
  small_class_id: 617
  )

ProductCategory.create(
  product_id: 6,
  large_class_id: 5,
  middle_class_id: 57,
  small_class_id: 473
  )
