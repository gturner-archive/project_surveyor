class ResponsesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @survey = get_survey
    if required_q_missing?
      @count = 0
      render "surveys/show"
    else
      build_all_responses
      redirect_to surveys_path
    end
  end

  private

    def build_all_responses
      build_nrq_responses
      build_mcq_responses
    end

    def build_nrq_responses
      params[:response][:nrq].each do |q_id, a_val|
        question = NumberRangeQuestion.find(q_id)
        question.responses.create(value: a_val, user_id: @user.id)
      end
    end

    def build_mcq_responses
      params[:response][:mcq].each do |q_id, a_val|
        question = MultipleChoiceQuestion.find(q_id)
        if a_val.is_a?(Array)
          vals = a_val.reject(&:empty?)
          vals.each do |val|
            question.responses.create(value: val, user_id: @user.id)
          end
        else
          question.responses.create(value: a_val, user_id: @user.id)
        end
      end
    end

    def required_q_missing?
      params[:response][:mcq].any? do |q_id, a_val|
        question = MultipleChoiceQuestion.find(q_id)
        if question.required
          if a_val.is_a?(Array)
            if a_val.reject(&:empty?).empty?
              @survey.errors[q_id] = "This field is required"
              true
            else
              false
            end
          else
            if a_val.empty?
              @survey.errors[q_id] = "This field is required"
              true
            else
              false
            end
          end
        end
      end
    end

    def get_survey
      hash = params[:response][:mcq].first
      question = MultipleChoiceQuestion.find(hash.first)
      Survey.find(question.survey_id)
    end

end
