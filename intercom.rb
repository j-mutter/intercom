## encoding: utf-8

require 'sinatra'

def access_url
  ENV['INTERCOM_URL']
end

def make_script(script)
	["#!/usr/bin/env bash", "URL=#{access_url}/", script].join("\n")
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
........('(...´...´.... ¯~/'...'
.........\.................'...../
..........''...\.......... _.·´
............\..............(
..............\.............\..."
  end
end

get '/' do
  set_message(params[:message]) if params[:message]
  $message
end

put '/' do
  set_message(params[:message]) if params[:message]
end

get '/install' do
  make_script File.read('scripts/install.sh')
end

get '/intercom' do
  script = File.read('scripts/intercom.sh')
  ["URL=#{access_url}/", script].join("\n")
end

get '/uninstall' do
  make_script File.read('scripts/uninstall.sh')
end

get '/plist' do
  File.read('./com.boourns.intercom.plist')
end
