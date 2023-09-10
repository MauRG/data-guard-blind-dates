# frozen_string_literal: true

require 'rails_helper'

describe BlindDate do
  it { is_expected.to validate_presence_of(:week) }

  it { should have_and_belong_to_many(:employees) }

  context 'When generating a group of blind dates' do
    before do
      Employee.create(name: '1', department: 'A')
      Employee.create(name: '2', department: 'A')
      Employee.create(name: '3', department: 'A')
      Employee.create(name: '4', department: 'A')
      Employee.create(name: '5', department: 'B')
      Employee.create(name: '6', department: 'B')
      Employee.create(name: '7', department: 'B')
      Employee.create(name: '8', department: 'C')
    end

    it 'generates 3 groups' do
      expect(described_class.generate(1, 2).count).to eq(4)
    end

    it 'the groups have the correct number of employees' do
      expect(described_class.generate(1, 3).map { |group| group.employees.count }).to eq([4, 4])
    end

    it 'distributes the departments' do
      expect(described_class.generate(1, 3).map { |group| group.employees.map(&:department) }).to eq([%w[A A B B], %w[A A B C]])
    end

    context 'when group size is larger than number of employees' do
      it 'generates 1 group' do
        expect(described_class.generate(1, 9).count).to eq(1)
      end
    end
  end
end
