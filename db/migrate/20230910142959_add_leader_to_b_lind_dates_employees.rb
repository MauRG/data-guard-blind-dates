class AddLeaderToBLindDatesEmployees < ActiveRecord::Migration[7.0]
  def change
    change_table :blind_dates_employees do |t|
      t.boolean :leader, default: false
    end
  end
end
