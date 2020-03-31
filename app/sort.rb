require_relative '../lib/scraper'
require_relative '../bin/main'
class Sort
    attr_reader :list, :scraper, :tot_countries, :tot_details, :letter

    def initialize 
        @tot_details = []
        @tot_countries = []
        @letter = ""
        @scraper = Scraper.new
    end

    def get_info_contrie country
        details_sort.length.times do |element|
            if details_sort[1] == country
                p details_sort(element)
                break
            end
        end
    end
    
    def details_sort
        main = Main.new
        main.scraper.start
        countries_sort(@letter).uniq.each do |item|
            @tot_details << main.get_info(item)
        end
        @tot_details.uniq
    end

    def countries_sort charac
        @letter = charac
        @scraper.start
        scraper.converter.each do |element|
            @tot_countries << element[1].to_s
        end
        @tot_countries.select{|element| element[0] == @letter}.uniq
    end
end




