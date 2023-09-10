# frozen_string_literal: true

Rails.application.routes.draw do
  get 'blind_dates/:week', to: 'blind_dates#index'
  post 'blind_dates/:week', to: 'blind_dates#generate'
end
