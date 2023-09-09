# frozen_string_literal: true

class Employee < ApplicationRecord
  has_and_belongs_to_many :blind_dates

  validates :name, :department, presence: true
end
