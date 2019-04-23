require 'sinatra'

# Create a class with 'each' method
class Stream
  def each
    10.times { |i| yield "#{i}," }
  end
end

get('/') { Stream.new }

get('/full-response') do
  [200, { Header1: Stream.new, Header2: Stream.new }, Stream.new]
end