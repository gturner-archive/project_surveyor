class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    @nrquestion = NumberRangeQuestion.new
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash.notice = "Your survey has been created."
      redirect_to @survey
    else
      flash.now.notice = "An error occurred."
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    @survey.number_range_questions.build
    @survey.multiple_choice_questions.build
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      flash.notice = "Your survey has been created."
      redirect_to @survey
    else
      flash.now.notice = "An error occurred."
      render :new
    end
  end

  def destroy
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :number_range_questions_attributes => [:min, :max, :title, :id, :required, :_destroy], :multiple_choice_questions_attributes => [:title, :id, :required, :multiple_choices, :_destroy])
  end

end
