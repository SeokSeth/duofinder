# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



@champ_name = Unirest.get "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=#{ENV["lol_api"]}"
@champ_name2 = @champ_name.body["data"]
@champ_name2.each do |hash|
	Champion.create(champ_id: hash[1]["id"], key: hash[1]["key"], name: hash[1]["name"], title: hash[1]["title"])
	
end
