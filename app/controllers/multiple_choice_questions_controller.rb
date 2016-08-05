class MultipleChoiceQuestionsController < ApplicationController

  def new
    @survey = Survey.find(params[:survey_id])
    @question = MultipleChoiceQuestion.new
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @survey.multiple_choice_questions.build(multiple_choice_question_params)
    if @survey.save
      flash.notice = "Your question has been created."
      redirect_to @survey
    else
      flash.now.notice = "An error occurred."
      render :new
    end
  end

  def destroy
    @question = MultipleChoiceQuestion.find(params[:id])
    @survey = Survey.find(params[:survey_id])
    @survey.multiple_choice_questions.destroy(@question)
    redirect_to @survey
  end

  private

    def multiple_choice_question_params
      params.require(:multiple_choice_question).permit(:multiple_choices, :title, :required)
    end

end
