require 'sinatra'

def access_url
  ENV['INTERCOM_URL']
end

def set_message(message)
  if message.match(/\A[\w\s-]*\z/)
    $message = message
  else
    "....................../´¯/) 
....................,/¯../ 
.................../..../ 
............./´¯/'...'/´¯¯`·¸ 
........../'/.../..../......./¨¯\ 
........('(...´...´.... ¯~/'...') 
.........\.................'...../ 
..........''...\.......... _.·´ 
............\..............( 
..............\.............\..."
  end
end

get '/' do
  set_message(message) if params[:message]
  $message
end

put '/' do
  set_message(message) if params[:message]
end

get '/install' do
  installer = File.read('./install.sh')
  ["#!/usr/bin/env bash", "URL=#{access_url}/", installer].join("\n")
end

get '/intercom' do
  script = File.read('./intercom.sh')
  ["URL=#{access_url}/", script].join("\n")
end

