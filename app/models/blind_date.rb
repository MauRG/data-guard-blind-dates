# frozen_string_literal: true

class BlindDate < ApplicationRecord
  has_and_belongs_to_many :employees

  validates :week, presence: true

  class << self
    def generate(week, size)
      employees = available_employees
      groups = number_of_groups(size, employees.count).times.map do
        BlindDate.create(week:)
      end
      distribute_employees(groups, employees)
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

    def create_blind_date(week, employees)
      blind_date = BlindDate.create(week:)
      # leader = employees.sample
      # employees -= leader
      blind_date.employees << employees
      blind_date
    end

    def available_employees
      Employee.all
    end
  end
end
