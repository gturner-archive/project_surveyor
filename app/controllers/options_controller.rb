class OptionsController < ApplicationController

  def new
    @question  = MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    @options = []
     session[:num_questions].times do
      @options << Option.new
     end
  end

  def create
    @question = MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    params["options"].each do |option|
      @question.options.create(option_params(option))
    end
    redirect_to new_survey_multiple_choice_question_path(@question.survey_id)
  end

  private
    def option_params(my_params)
      my_params.permit(:title)
    end

end
