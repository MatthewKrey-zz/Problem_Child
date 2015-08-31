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

  get '/001_introduction/02_mvp_homepage' do
    erb :'001_introduction/02_mvp_homepage'
  end

  get '/001_introduction/03_mvp_homepage' do
    erb :'001_introduction/03_mvp_homepage'
  end

  post '/001_variables' do
    @user = User.create(params[:user])
    erb :'001_variables/01_question'
  end

  get '/001_variables/02_question' do
    @user = User.last
    erb :'001_variables/02_question'
  end

  get '/001_variables/03_question' do
    @user = User.last
    erb :'001_variables/03_question'
  end

  get '/001_variables/04_question' do
    @user = User.last
    erb :'001_variables/04_question'
  end

  get '/001_variables/05_question' do
    @user = User.last
    erb :'001_variables/05_question'
  end

  get '/001_variables/06_question' do
    @user = User.last
    erb :'001_variables/06_question'
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
