# frozen_string_literal: true

class CreateBlindDates < ActiveRecord::Migration[7.0]
  def change
    create_table :blind_dates do |t|
      t.integer :week
      t.integer :year

      t.timestamps
    end
  end
end
