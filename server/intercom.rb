require 'sinatra'

get '/' do
  $message
end

put '/' do
  $message = params[:message]
end


