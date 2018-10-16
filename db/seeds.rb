require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hcm = City.create({ ja_name: 'ホーチミン市', en_name: 'hochiminh' })
# District.create([
#   { city_id: hcm.id, ja_name: '１区', en_name: 'dist1', vn_name: 'Quan 1' },
#   { city_id: hcm.id, ja_name: '２区', en_name: 'dist2', vn_name: 'Quan 2' },
#   { city_id: hcm.id, ja_name: '３区', en_name: 'dist3', vn_name: 'Quan 3' },
#   { city_id: hcm.id, ja_name: '４区', en_name: 'dist4', vn_name: 'Quan 4' },
#   { city_id: hcm.id, ja_name: '５区', en_name: 'dist5', vn_name: 'Quan 5' },
#   { city_id: hcm.id, ja_name: '６区', en_name: 'dist6', vn_name: 'Quan 6' },
#   { city_id: hcm.id, ja_name: '７区', en_name: 'dist7', vn_name: 'Quan 7' },
#   { city_id: hcm.id, ja_name: '８区', en_name: 'dist8', vn_name: 'Quan 8' },
#   { city_id: hcm.id, ja_name: '９区', en_name: 'dist9', vn_name: 'Quan 9' },
#   { city_id: hcm.id, ja_name: 'ゴバップ区', en_name: 'govap', vn_name: 'Quan Go Vap' },
# ])
# Area.create([
#   { city_id: hcm.id, ja_name: 'ドンコイ通り周辺', en_name: 'dongkhoi' },
#   { city_id: hcm.id, ja_name: 'ベンタイン市場周辺', en_name: 'benthanh' },
#   { city_id: hcm.id, ja_name: 'ファングーラオ通り周辺', en_name: 'phamngulao' },
#   { city_id: hcm.id, ja_name: 'レタントン通り周辺', en_name: 'lethanhton' },
#   { city_id: hcm.id, ja_name: 'チョロン周辺', en_name: 'cholon' },
#   { city_id: hcm.id, ja_name: 'タンソンニャット空港周辺', en_name: 'airport' },
#   { city_id: hcm.id, ja_name: 'フーミンフン地区', en_name: 'phumyhung' },
# ])
Category.create([
  # {ja_name: '雑貨', en_name: 'shops'}
  {ja_name: '雑貨', en_name: 'spa'},
  {ja_name: '雑貨', en_name: 'salon'},
  {ja_name: '雑貨', en_name: 'nail'},
  {ja_name: '雑貨', en_name: 'love'},
  {ja_name: '雑貨', en_name: 'sight'}
])