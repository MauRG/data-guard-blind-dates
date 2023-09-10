# frozen_string_literal: true

class BlindDatesController < ApplicationController
  # GET /blind_dates/:week/
  def index
    blind_dates = BlindDate.where(week: params[:week])

    render json: blind_dates, include: [:blind_dates_employees, :employees]
  end

  # POST /blind_dates/:week/
  def generate
    week = params.require(:week)
    size = params.fetch(:size, 4)

    blind_dates = BlindDate.generate(week, size)
    render json: blind_dates, include: [:blind_dates_employees, :employees], status: :created
  end
end
