# frozen_string_literal: true

class BlindDatesEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :blind_date
end
