require '../lib/scraper'

describe Scraper do
  let(:scraper) { Scraper.new }

  describe '#principales_titles' do
    it 'Returns the principales titles of each countrie' do
      scraper.start
      expect(scraper.principales_titles.empty?).to eql(false)
    end
    it 'Does not return an empty array when we make a connection' do
      scraper.start
      expect(scraper.principales_titles.empty?).not_to eql(true)
    end
  end

  describe '#converter' do
    it 'Each detail has it title and the first is Country, Other' do
      scraper.start
      expect(scraper.converter[0][0]).to eql('Country, Other')
    end
    it 'Returns each countrie with coronavirus in details in a two dimensional array' do
      scraper.start
      expect(scraper.converter.length).not_to eql(1)
    end
  end
end
