require 'sinatra'
require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '/views')}
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'index'
  end

  post '/001_variables' do
    @user = User.new(params)
    erb :'001_variables/variables_index'
  end

  post '/001_variables/variables_index' do
    @answer = Answer.new(params)
    if @params["answer"] == "Users"
      # flash[:notice] = "Incorrect answer! Here's why"
      erb :'001_variables/correct_answer'
    elsif @params["answer"] == "User"
      # flash[:notice] = "Awesome!"
      erb :'001_variables/correct_answer'
    end
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
