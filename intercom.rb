require 'sinatra'

def access_url
  ENV['INTERCOM_URL']
end

def make_script(script)
	["#!/usr/bin/env bash", "URL=#{access_url}/", script].join("\n")
end

get '/' do
  $message = params[:message] if params[:message]
  $message
end

put '/' do
  $message = params[:message]
end

get '/install' do
  make_script File.read('scripts/install.sh')
end

get '/intercom' do
  script = File.read('./intercom.sh')
  ["URL=#{access_url}/", script].join("\n")
end

get '/uninstall' do
  make_script File.read('scripts/uninstall.sh')
end
