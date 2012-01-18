require 'rubygems'
require 'sinatra'
require 'json'
require 'net/http'

get '/' do
  "Hello world, it's #{Time.now} at the server!"
end

get '/victor' do
  "Hello Victor"
end

get '/:time/:first/:second' do |time,first,second|

  # search using topsy API
  s1 = search(first)
  s2 = search(second)

  # if the hash has a key corresponding with time url argument
  if s1.has_key? "#{time}"
    r = s1["#{time}"]
    "#{first}: #{r}"
  # else error msg
  else
    "Error in url: #{request.url} \r\n\t Use a, m, w, d or h"
  end

  #"Data: #{data} \r\n
  # Result: #{result}\r\n"
end

# Search function using Topsy API
def search(var)

  #Get HTTP URL
  base_url = "http://otter.topsy.com/searchcount.json?type=tweet"
  url = "#{base_url}&q=#{URI.encode(var)}"
  resp = Net::HTTP.get_response(URI.parse(url))
  data = resp.body
  
  #Transform in hash
  result = JSON.parse(data) #Transform in hash

  return result["response"]
end
