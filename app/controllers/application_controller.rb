require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])

      @heroes = params[:team][:members].collect do |details|
        Hero.new({name: details[:name], power: details[:power], bio: details[:bio]})
      end
      erb :team
    end

end
