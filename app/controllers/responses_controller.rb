class ResponsesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    build_all_responses
    redirect_to surveys_path
  end

  private

    def build_all_responses
      build_nrq_responses
      build_mcq_responses
    end

    def build_nrq_responses
      params[:survey][:nrq].each do |q_id, a_val|
        question = NumberRangeQuestion.find(q_id.to_i)
        question.responses.create(value: a_val, user_id: @user.id)
      end
    end

    def build_mcq_responses
      params[:survey][:mcq].each do |q_id, a_val|
        question = MultipleChoiceQuestion.find(q_id.to_i)
        question.responses.create(value: a_val, user_id: @user.id)
      end
    end

end
