# rubocop:disable all
#!/usr/bin/env ruby
require_relative '../lib/lita/handlers/scraper'

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
        @scraper.sort_list.compact.each do |element|
            if element[0]["Country"].downcase.strip.match(name.downcase.strip)
                puts "\nCountry : #{element[0]["Country"]}\n
                total cases : #{element[1]["Total cases"]}\n
                new cases : #{element[2]["new cases"]}\n
                total death : #{element[3]["Total deaths"]}\n
                new deaths : #{element[4]["New death"]}\n
                total recovered : #{element[5]["Total recovered"]}\n
                active cases : #{element[6]["Active Cases"]}\n
                serious cirtical : #{element[7]["Serious Critical"]}\n
                total cases/1M pop : #{element[8]["Total cases/1M pop"]} "
                break
            end
        end
    end
end

main = Main.new
main.scraper.start
main.give_name

