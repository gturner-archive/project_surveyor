class NumberRangeQuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @question = NumberRangeQuestion.new
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @survey.number_range_questions.build(number_range_question_params)
    if @survey.save
      flash.notice = "Your question has been created."
      redirect_to @survey
    else
      flash.now.notice = "An error occurred."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def number_range_question_params
      params.require(:number_range_question).permit(:max, :min, :title, :required)
    end
end
