# frozen_string_literal: true

require_relative '../enumerable.rb'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 4] }
  describe '#my_each' do
    result = []
    it 'returns it self' do
      expect(arr.my_each { |i| result << i + 1 }).to eql([1, 2, 3, 4])
    end

    it 'iterates through each element in an array' do
      expect(result).to eql([2, 3, 4, 5])
    end
  end

  describe '#my_each_with_index' do
    result = []
    it 'returns it self' do
      expect(arr.my_each_with_index { |_i, index| result << index }).to eql([1, 2, 3, 4])
    end

    it 'iterates through each element with index in an array' do
      expect(result).to eql([0, 1, 2, 3])
    end
  end

  describe '#my_select' do
    it 'should return a new array of even numbers' do
      expect(arr.my_select { |i| i < 3 }).to eql([1, 2])
    end
  end

  describe '#my_all?' do
    it 'should return true if every element within the array passes the condition in the block given' do
      expect(arr.my_all? { |i| i.is_a? Integer }).to eql(true)
    end

    it 'should return false if one or more elements fail the condition in the block given' do
      expect(arr.my_all?(&:even?)).to eql(false)
    end
  end

  describe '#my_any?' do
    it 'should return true if any element passes the condition in the block given' do
      expect(arr.my_any?(&:odd?)).to eql(true)
    end

    it 'should return false if no element passes the condition in the block given' do
      expect(arr.my_any? { |i| i > 5 }).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'should return false if any element passes the condition in the block given' do
      expect(arr.my_none?(&:odd?)).to eql(false)
    end

    it 'should return true if no element passes the condition in the block given' do
      expect(arr.my_none? { |i| i > 5 }).to eql(true)
    end
  end

  describe '#my_count' do
    it 'should return the length of the array if no block or argument is given' do
      expect(arr.my_count).to eql(arr.length)
    end

    it 'should return how many times the parameter given exists within the array' do
      expect(arr.my_count(1)).to eql(1)
    end

    it 'should take a block' do
      expect(arr.my_count(&:even?)).to eql(2)
    end
  end

  describe '#my_map' do
    my_proc = proc { |i| i + 1 }
    it 'should take a proc' do
      expect(arr.my_map(&my_proc)).to eql([2, 3, 4, 5])
    end

    it 'should return a new array with a block run on each element' do
      expect(arr.my_map { |i| i + 1 }).to eql([2, 3, 4, 5])
    end
  end

  describe '#my_inject' do
    it 'Should return the accumulator when given a block' do
      expect(arr.my_inject { |acc, i| acc + i }).to eql(10)
    end

    it 'should take an argument that sets the default of the accumulator' do
      expect(arr.my_inject(-5) { |acc, i| acc + i }).to eql(5)
    end
  end
end
