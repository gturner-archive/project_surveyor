class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    @user = User.first
    @survey = Survey.find(params[:id])
    @count = 0
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
    params.require(:survey).permit(:title, :description)
  end

end
