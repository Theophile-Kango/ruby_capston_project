require '../bin/main'

describe Main do
  let(:main) { Main.new }

  describe '#get_info' do
    it 'Returns a string of coronavirus information about the countrie given in parameter' do
      main.scraper.start
      expect(main.get_info('drc').class).to eql(String)
    end
    it 'Returns an ampty array if we put an ampty string in parameter' do
      main.scraper.start
      expect(main.get_info('').length).not_to eql(1)
    end
  end
end
