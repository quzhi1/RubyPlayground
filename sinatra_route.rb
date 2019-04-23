require 'sinatra'

get '/' do
  'Hello world!'
end

# Parameterized path (Hash)
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}!"
end

# Parameterized path (Block)
get '/hello/block/:name' do |n|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  # n stores params['name']
  "Hello #{n}!"
end

# Splat (Hash)
get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat'] # => ["hello", "world"]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  params['splat'] # => ["path/to/file", "xml"]
end

# Splat (Block)
get '/download/*.*' do |path, ext|
  [path, ext] # => ["path/to/file", "xml"]
end

# Regex parameterized path
get %r{/hello/([\w]+)} do
  "Hello, #{params['captures'].first}!"
end

# Regex parameterized path (Block)
get %r{/hello/block/([\w]+)} do |c|
  # Matches "GET /hello/block/world" etc.
  "Hello block, #{c}!"
end

# Optional parameters
get '/posts/:format?' do
  # matches "GET /posts/" and any extension "GET /posts/json", "GET /posts/xml" etc
  "Hello optional, #{params['format']}"
end

# Query parameters
get '/posts' do
  # matches "GET /posts?title=Julius%20Caesar&author=Shakespeare"
  title = params['title']
  author = params['author']
  # uses title and author variables; query is optional to the /posts route
  "Query parameters: #{title}, #{author}"
end

# customize the Mustermann options
get '\A/mustermann\z',
    :mustermann_opts => { type: :regexp, check_anchors: false } do
  # matches /posts exactly, with explicit anchoring
  'If you match an anchored pattern clap your hands!'
end