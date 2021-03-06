require 'nokogiri'
require 'httparty'

class Scraper
  attr_reader :sort_list, :title_header, :details, :title_header_arr,
              :details_arr, :details_arr_sort

  def start
    url = 'https://www.worldometers.info/coronavirus/'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    body = parsed_page.css('tbody')
    @title_header = parsed_page.css('th')
    tr = body.css('tr')
    @details = tr.css('td')
    @title_header_arr = []
    @details_arr = []
    @details_arr_sort = []
  end

  def principales_titles
    @title_header.each do |item|
      @title_header_arr << uppercase(item.text.to_s)
    end
    @title_header_arr.uniq.compact
  end

  def converter
    arr = []
    arr << principales_titles
    arr << countries_details
    n = 0
    countries_details_length = countries_details.length / principales_titles.length
    countries_details_length.times do |i|
      @details_arr_sort << []
      principales_titles.length.times do |j|
        @details_arr_sort[i].push(arr[0][j])
        @details_arr_sort[i].push(arr[1][n])
        n += 1
      end
    end
    @details_arr_sort.uniq.compact
  end

  private

  def countries_details
    @details.each do |item|
      @details_arr << item.text.to_s
    end
    @details_arr.map { |x| x == '' ? '0' : x }
  end

  def uppercase(name)
    mat = /[[:upper:]]/.match(name[1, name.length - 1]).to_s
    name.include?(mat) ? name.insert(name.index(mat), ' ') : name
  end
end
