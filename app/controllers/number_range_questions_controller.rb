class NumberRangeQuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @survey = Survey.find(params[:id])
    @question = NumberRangeQuestion.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
