require 'rubygems'

require 'sinatra'

get '/' do
  "Hello world, it's #{Time.now} at the server!"
end

get '/victor' do
  "Hello Victor"
end

get '/c/:first/:second' do |first,second|
  "First word: #{first} \r\n 
  Second word: #{second}"
end
