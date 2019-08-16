require_relative '../enumerable.rb'

RSpec.describe Enumerable do
  let(:arr) {[1, 2, 3, 4]}
  describe '#my_each' do
    result = []
    it 'returns it self' do
      expect(arr.my_each{|i| result << i + 1}).to eql([1, 2, 3, 4])
    end

    it 'iterates through each element in an array' do
      expect(result).to eql([2, 3, 4, 5])
    end
  end

  describe '#my_each_with_index' do
    result = []
    it 'returns it self' do
      expect(arr.my_each_with_index{|i, index| result << index}).to eql([1, 2, 3, 4])
    end

    it 'iterates through each element with index in an array' do
      expect(result).to eql([0, 1, 2, 3])
    end
  end

  describe '#my_select' do
    it 'should return a new array of even numbers' do
      expect(arr.my_select {|i| i.even?}).to eql([2, 4])
    end
  end 

  describe '#my_all?' do
    it 'should return true if every element within the array passes the condition in the block given' do
      expect(arr.my_all? {|i| i.is_a? Integer }).to eql(true)
    end

    it 'should return false if one or more elements fail the condition in the block given' do
      expect(arr.my_all? { |i| i.even? }).to eql(false)
    end
  end

  describe '#my_any?' do
    it 'should return true if any element passes the condition in the block given' do
      expect(arr.my_any? { |i| i.odd?}).to eql(true)
    end

    it 'should return false if no element passes the condition in the block given' do
      expect(arr.my_any? { |i| i > 5}).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'should return false if any element passes the condition in the block given' do
      expect(arr.my_none? { |i| i.odd?}).to eql(false)
    end

    it 'should return true if no element passes the condition in the block given' do
      expect(arr.my_none? { |i| i > 5}).to eql(true)
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
      expect(arr.my_count { |i| i.even?}).to eql(2)
    end
  end
end