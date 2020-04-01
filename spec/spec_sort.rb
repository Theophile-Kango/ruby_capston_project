require '../lib/sort'

describe Sort do
  let(:sort) { Sort.new }

  describe '#countries_sort' do
    it 'Returns the countries starting by a letter in parametter' do
      expect(sort.countries_sort('C').include?('China')).to eql(true)
    end
    it 'Returns total in the countries list when we pass T in parameter' do
      expect(sort.countries_sort('T').include?('Total:')).not_to eql(false)
    end
  end
end
