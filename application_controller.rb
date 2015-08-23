require_relative 'models/rubyfile.rb'
require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/send' do
    puts params
    @message = Message.new(params["number"], params["message"])
    @client = Twilio::REST::Client.new('ACed3ed813257f8acedfce46a695216257','cb1dd832eda91ea39319fe6827f1650b')
    @client.messages.create(
  from: '+14342605034', 
  to: @message.number,
  body: @message.message
)    
    erb :send
  end 
  
  get '/index.erb' do
    erb :index
  end 
end