require 'sinatra'

# Render erb file
get '/' do
  erb :index
end

# Directly render erb
get '/content' do
  code = '<%= Time.now %>'
  erb code
end

get '/' do
  erb :index, :layout => :post
end
