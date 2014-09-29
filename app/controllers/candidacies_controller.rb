class CandidaciesController < ApplicationController
  # Skip CSRF projection for this API controller.
  skip_before_action :verify_authenticity_token
  # API auth found in application_controller.rb
  before_action :api_authenticate

  def update_questionnaire
    respond_to do |format|
      format.json do
        @candidacy = Candidacy.find(params[:id])
        unless params[:questionnaire].nil?
          @candidacy.update_attribute(:questionnaire, params[:questionnaire])
        end
        render json: @candidacy
      end
    end
  end
end
