# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'random_name_generator'

def name_generator
  @name_generator ||= RandomNameGenerator.new
end

5.times do
  Employee.create(name: name_generator.compose, department: 'Engineering')
end

8.times do
  Employee.create(name: name_generator.compose, department: 'Sales')
end

3.times do
  Employee.create(name: name_generator.compose, department: 'HR')
end
