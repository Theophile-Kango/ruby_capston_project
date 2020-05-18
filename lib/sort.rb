require_relative './connect'
require_relative '../bin/main'

class Sort
  attr_reader :list, :con, :tot_countries, :tot_details, :letter

  def initialize
    @tot_details = []
    @tot_countries = []
    @letter = ''
    @con = Connect.new
  end

  def countries_sort(charac)
    @letter = charac

    @con.countries.each do |element|
      @tot_countries << element["Country"].to_s
    end

    @tot_countries.select { |element| element[0] == @letter.upcase }.uniq
  end

end

sort = Sort.new
p sort.countries_sort("c")