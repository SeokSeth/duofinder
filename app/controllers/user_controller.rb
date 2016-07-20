class UserController < ApplicationController
  def show
	@icon = Unirest.get "https://na.api.pvp.net/api/lol/#{current_user.region}/v1.4/summoner/by-name/#{current_user.game_name}?api_key=#{ENV["lol_api"]}"
	@user_id = @icon.body["#{current_user.game_name}"]["id"]
  	@champs_played = Unirest.get "https://na.api.pvp.net/championmastery/location/NA1/player/#{@user_id}/topchampions?api_key=#{ENV["lol_api"]}"
 	@champs_info = @champs_played.body
 	@champ_name = Champion.all
 	if !@icon.body["status"].nil? && @icon.body["status"]["message"] == "Not Found"
 		@msg = "Username could not be found, please try agian"
 		redirect_to "/users/edit?message=#{@msg}"
 	else
 	@icon_id = @icon.body["#{current_user.game_name}"]["profileIconId"]
 	@current_version_data = Unirest.get "https://na.api.pvp.net/api/lol/static-data/na/v1.2/versions?api_key=#{ENV["lol_api"]}"
 	@current_version = @current_version_data.body[0]
 	@profile_icon_url = "http://ddragon.leagueoflegends.com/cdn#{@current_version}/img/profileicon/#{@icon_id}.png"
 	end
  end

  def edit
  end
end
