require 'sinatra'

def access_url
  ENV['INTERCOM_URL']
end

get '/' do
  $message
end

put '/' do
  $message = params[:message]
end

get '/install' do
  installer = File.read('./install.sh')
  ["#!/usr/bin/env bash", "URL=#{access_url}/", installer].join("\n")
end

get '/intercom' do
  script = File.read('./intercom.sh')
  ["#!/usr/bin/env bash", "URL=#{access_url}/", script].join("\n")
end

