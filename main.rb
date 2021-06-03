

require 'segment/analytics'
require 'socket'

# HOW TO RUN RUBY SERVER : at external terminal run: ruby main.rb


hostname = "localhost"
port = "3001"

server = TCPServer.open(hostname,port)


Analytics = Segment::Analytics.new({
    write_key: '3jFaE5DIAv31Dsxj6NaojIUJiiPZSvA9',
    on_error: Proc.new { |status, msg| print msg },
    batch_size: 1,
    # stub: true
})

Analytics.identify(
    user_id: 'test111',
    traits: { 
       email: 'test@test.com',
       friends: 872
     },
    context: {
    ip: '8.8.8.8'
})

Analytics.track(
    user_id: 'test111',
    event: 'Article Bookmarked',
    properties: {
      title: 'Snow Fall',
      subtitle: 'The Avalance at Tunnel Creek',
      author: 'John Branch'
})

# ----------------------------------------------------------------------------------
# BEGIN practice CODE
# ----------------------------------------------------------------------------------




# ----------------------------------------------------------------------------------

Analytics.flush

puts 'done'