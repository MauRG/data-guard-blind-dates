# frozen_string_literal: true

class CreateEmployee < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :department, null: false

      t.timestamps
    end
  end
end
