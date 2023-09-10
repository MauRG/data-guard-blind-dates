# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :blind_dates_employees
  has_many :blind_dates, through: :blind_dates_employees

  validates :name, :department, presence: true
end
