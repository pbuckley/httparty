dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'httparty')
require 'pp'

# You can also use post, put, delete, head, options in the same fashion
response = HTTParty.get('http://twitter.com/statuses/public_timeline.json')
puts response.body, response.code, response.message, response.headers.inspect

response.each do |item|
  puts item['user']['screen_name']
end

# An example post to a minimal rails app in the development environment
# Note that "skip_before_filter :verify_authenticity_token" must be set in the 
# "pears" controller for this example

class Partay
  include HTTParty
  base_uri 'http://localhost:3000'
end

options = { 
  :body => {
    :pear => { # your resource
      :foo => '123', # your columns/data
      :bar => 'second',
      :baz => 'last thing'
    }
  }
}

pp Partay.post('/pears.xml', options)
