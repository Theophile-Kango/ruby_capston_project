# rubocop:disable all
#!/usr/bin/env ruby
require_relative '../lib/scraper'

class Main
    attr_reader :scraper

    def initialize
        @scraper = Scraper.new
    end

    def give_name
        expect_ans = ["YES","yes","Yes","Y","y"]
        answer = "yes"
        country = ""
        while expect_ans.any?(answer) do
            puts "Give me a country name and I will give back corona informations about the country"
            country = gets.chomp
            get_info(country)
            puts "do you want to ask for an other Country? [yes,no]"
            answer = gets.chomp
        end
    end

    def get_info(name)
        res = ""
        @scraper.converter.each do |item|  
            if item[1].to_s.downcase.strip.match(name.downcase.strip) 
               res = item.uniq.to_s      
            end      
        end
        res
    end
end

main = Main.new
main.scraper.start
#puts main.get_info("congo")
# main.give_name
