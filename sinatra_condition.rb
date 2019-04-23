require 'sinatra'

# Filter user agent
get '/foo', :agent => %r{Firefox.*} do
  "You're using Firefox version #{params['agent'][0]}"
end

get '/foo' do
  # Matches non-songbird browsers
  'Not a firefox'
end

# Filter hostname
get '/', :host_name => /^admin\./ do
  "Admin Area, Access denied!"
end

# Filter Accept header
get '/', :provides => 'html' do
  haml :index
end

get '/', :provides => ['rss', 'atom', 'xml'] do
  builder :feed
end

# Customize condition
set(:probability) { |value| condition { rand <= value } }

get '/win_a_car', :probability => 0.3 do
  'You won!'
end

get '/win_a_car' do
  'Sorry, you lost.'
end

# Use splat to take multiple values
set(:auth) do |*roles| # <- notice the splat here
  condition do
    unless logged_in? && roles.any? {|role| current_user.in_role? role }
      redirect "/login/", 303
    end
  end
end

get '/my/account/', :auth => %i{user admin} do
  'Your Account Details'
end

get '/only/admin/', :auth => :admin do
  'Only admins are allowed here!'
end