require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new({name: params[:team][:name], motto: params[:team][:motto]})

        params[:team][:heros].each {|hero| Hero.new(hero)}
  

        @heros = Hero.all

        erb :team
    end


end
