require_relative './scraper'
require_relative '../bin/main'
class Sort
  attr_reader :list, :scraper, :tot_countries, :tot_details, :letter

  def initialize
    @tot_details = []
    @tot_countries = []
    @letter = ''
    @scraper = Scraper.new
  end

  def countries_sort(charac)
    @letter = charac
    @scraper.start
    scraper.converter.each do |element|
      @tot_countries << element[1].to_s
    end
    @tot_countries.select { |element| element[0] == @letter }.uniq
  end
end
