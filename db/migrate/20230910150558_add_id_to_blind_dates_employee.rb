class AddIdToBlindDatesEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :blind_dates_employees, :id, :primary_key
  end
end
