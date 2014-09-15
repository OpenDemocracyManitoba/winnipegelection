class CandidaciesController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF projection for this API controller.
  before_action :api_authenticate # Found in application_controller.rb

  def update_questionnaire
    respond_to do |format|
      format.json do
        @candidacy = Candidacy.find(params[:id])
        if params[:questionnaire].present?
          @candidacy.update_attribute(:questionnaire, params[:questionnaire])
        end
        render json: @candidacy
      end
    end
  end
end
