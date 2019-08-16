require_relative '../enumerable.rb'

RSpec.describe Enumerable do
  let(:arr) {[1, 2, 3, 4]}
  describe '#my_each' do
    result = []
    it 'It returns it self' do
      expect(arr.my_each{|i| result << i + 1}).to eql([1, 2, 3, 4])
    end

    it 'It iterates through each element in an array' do
      expect(result).to eql([2, 3, 4, 5])
    end
  end

  describe '#my_each_with_index' do
    result = []
    it 'It returns it self' do
      expect(arr.my_each{|i, indx| result << indx}).to eql([1, 2, 3, 4])
    end

    it 'It iterates through each element with index in an array' do
      expect(result).to eql([0, 1, 2, 3])
    end
  end

end