class MultipleChoiceQuestionsController < ApplicationController

  def new
    @survey = Survey.find(params[:survey_id])
    @question = MultipleChoiceQuestion.new
    @num_questions = ""
  end

  def create
    @survey = Survey.find(params[:survey_id])

    question = @survey.multiple_choice_questions
                .build(multiple_choice_question_params)

   var = params[:multiple_choice_question]
   session[:num_questions] = var[:number_questions].to_i
    if @survey.save
      flash.notice = "Your question has been created."
      redirect_to new_multiple_choice_question_option_path(question)
    else
      flash.now.notice = "An error occurred."
      render :new
    end
  end

  def edit
    @question = MultipleChoiceQuestion.find(params[:id])
    @survey = Survey.find(@question.survey_id)
    @num_questions = session[:num_questions]
  end

  def update
    @question = MultipleChoiceQuestion.find(params[:id])

   var = params[:multiple_choice_question]
   session[:num_questions], @num_questions = var[:number_questions].to_i
    if @question.update(multiple_choice_question_params)
      flash.notice = "Your question has been updated."
      redirect_to new_multiple_choice_question_option_path(@question)
    else
      flash.now.notice = "An error occurred."
      render :new
    end
  end

  def destroy
    @question = MultipleChoiceQuestion.find(params[:id])
    redirect_to edit_survey_path(@question.survey_id)
    @question.destroy
  end

  private

    def multiple_choice_question_params
      params.require(:multiple_choice_question).permit(:multiple_choices, :title, :required)
    end

end
