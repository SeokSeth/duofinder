class HomeController < ApplicationController
require 'lol'
require 'unirest'
before_filter :authenticate_user!
  def index

  	@client = Lol::Client.new "#{ENV["lol_api"]}", {region: "na"}
  	@champs = @client.champion.get
  	@champ_name = Champion.all


  end


end
