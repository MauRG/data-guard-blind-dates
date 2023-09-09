# frozen_string_literal: true

class BlindDate < ApplicationRecord
  has_and_belongs_to_many :employees

  validates :week, presence: true
end
