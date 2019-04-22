require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: {gossips: Gossip.all}
    end
    
    get '/gossips/new/'do
       erb :new_gossip
    end
    
    post '/gossips/new/' do
        Gossip.new(params["gossip_author"], params["gossip_content"]).save
        puts "Le gossip est enregistré dans la BBD"
        redirect '/'
      end
    
    get '/gossips/:id/' do
        @id = params[:id]
        erb :show
    end

    get '/gossips/id/edit/' do
        erb :edit
    end
end
#---------------------------------------------------------------------------------------
=begin
    post '/gossips/id/edit/' do
       
    end

=end
