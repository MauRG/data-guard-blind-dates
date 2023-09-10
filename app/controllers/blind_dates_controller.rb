class BlindDatesController < ApplicationController
  # GET /blind_dates/:week/
  def index
    @blind_dates = BlindDate.where(week: params[:week])

    render json: @blind_dates
  end

  # POST /blind_dates/:week/
  def generate
    #generate blind dates
    render status: :created
  end

  private

  # Only allow a list of trusted parameters through.
  def blind_date_params
    params.fetch(:week, nil)
  end
end
