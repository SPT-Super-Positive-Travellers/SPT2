# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(
  email: "1@1", 
  encrypted_password: "123456"
  )
  
Customer.create(
  email: "1@1",
  encrypted_password: "123456", 
  last_name: "符蘭死寿古", 
  last_name_kana: "フランシスコ", 
  first_name: "痤美柄流",
  first_name_kana: "ザビエル",
  address: "シスコン共和国　最果ての新境地　万々地",
  postal_code: "464949",
  phone_number: "09012345678",
  )
  
ItemGenre.create([
  {name: 'ケーキ'},
  {name: 'プリン'},
  {name: '焼き菓子'},
  {name: 'キャンディ'}
  ])