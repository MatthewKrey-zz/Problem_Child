require 'sinatra'
require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '/views')}

  get '/' do
    erb :'index'
  end

  post '/001_variables' do
    @user = User.new(params)
    erb :'001_variables/variables_index'
  end
end

  # get '/' do
  #   erb :shiaku_page
  # end
  #
  # post '/' do
  #   # user = params[:user]
  #   haiku = Haiku.new
  #   haiku.create_poem
  #   @first_line = haiku.first_line
  #   @second_line = haiku.second_line
  #   @third_line = haiku.third_line
  #   erb :shiaku_page
  # end
