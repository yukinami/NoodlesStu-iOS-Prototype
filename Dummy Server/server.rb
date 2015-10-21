require 'rubygems'
require 'sinatra'
require 'json'

configure do
    set :logging, true
    set :dump_errors, true
    set :public_folder, Proc.new { File.expand_path(File.join(root, 'Fixtures')) }
end

def render_fixture(filename)
    send_file File.join(settings.public_folder, filename)
end

get '/recruitments' do
    render_fixture('recruitments.json')
end

# Return a 503 response to test error conditions
get '/offline' do
    status 503
end

# Simulate a JSON error
get '/error' do
    status 400
    content_type 'application/json'
    "{\"error\": \"An error occurred!!\"}"
end