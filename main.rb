require 'sinatra'
require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, '/views')}
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'001_introduction/01_introduction'
  end

  get '/001_introduction/02_founders' do
    erb :'001_introduction/02_founders'
  end

  get '/001_introduction/03_mvp_homepage' do
    erb :'001_introduction/03_mvp_homepage'
  end

  post '/001_variables' do
    @user = User.create(params[:user])
    erb :'001_variables/01_question_1'
  end

  get '/001_variables/02_question_2' do
    @user = User.first
    # binding.pry
    erb :'001_variables/02_question_2'
  end

  post '/001_variables/variables_index' do
    @answer = Answer.new(params)
    if @params["answer"] == "Users"
      erb :'001_variables/correct_answer'
      flash[:notice] = "Incorrect answer! Here's why"
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
