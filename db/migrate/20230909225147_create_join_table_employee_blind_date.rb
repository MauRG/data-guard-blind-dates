# frozen_string_literal: true

class CreateJoinTableEmployeeBlindDate < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employees, :blind_dates
  end
end
