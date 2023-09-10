# frozen_string_literal: true

class BlindDate < ApplicationRecord
  has_many :blind_dates_employees
  has_many :employees, through: :blind_dates_employees

  validates :week, presence: true

  class << self
    def generate(week, size)
      employees = available_employees
      groups = number_of_groups(size, employees.count).times.map do
        BlindDate.create(week:)
      end
      distribute_employees(groups, employees)
      assign_leader(groups.first)
      groups
    end

    private

    def distribute_employees(groups, employees)
      employees.order(:department)
      employees.each_with_index do |employee, index|
        groups[index % groups.size].employees << employee
      end
    end

    def number_of_groups(size, employee_count)
      return 1 if employee_count < size

      quantity = (employee_count / size).floor

      extra_people = employee_count - (quantity * size)
      missing_people = employee_count % size

      quantity += 1 if extra_people > missing_people
      quantity
    end

    def assign_leader(group)
      group.blind_dates_employees.sample.update_attribute(:leader, true)
    end

    def available_employees
      Employee.all
    end
  end
end
