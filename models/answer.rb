class Answer < ActiveRecord::Base
  def initialize(params)
    @params = params
  end
end
