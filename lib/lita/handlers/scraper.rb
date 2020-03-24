# rubocop:disable all
require "nokogiri"
require "httparty"
require "byebug"

class Scraper
  attr_reader :sort_list,  :title_header, :details, :title_header_arr, 
              :details_arr, :details_arr_sort

  def start
    url = "https://www.worldometers.info/coronavirus/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    body = parsed_page.css("tbody")
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
    @title_header_arr.uniq
  end

  def converter
    arr = []
    arr << principales_titles
    arr << countries_details
    n = 0
    countries_details_length = countries_details.length/principales_titles.length
    tile_length = principales_titles.length
    for i in 0..countries_details_length/8
      @details_arr_sort << []
      for j in 1..tile_length
        @details_arr_sort[i].push(arr[0][j-1])
        @details_arr_sort[i].push(arr[1][n])
        n += 1
      end
    end
    @details_arr_sort.uniq
  end

  private

  def uppercase(name)
      mat = /[[:upper:]]/.match(name[1,name.length-1]).to_s
      res = name.include?(mat) ? name.insert(name.index(mat), " ") : name
  end

  def countries_details
    @details.each do |item|
      @details_arr << item.text.to_s
    end
    @details_arr.map { |x| x == "" ? "0" : x }
  end

end
