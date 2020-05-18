# rubocop:disable all
#!/usr/bin/env ruby
require_relative '../lib/connect'

class Main
    attr_reader :con

    def initialize
        @con = Connect.new
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
        arr = []
        @con.countries.each do |item|  
            if item["Country"].to_s.downcase.strip.match(name.downcase.strip) 
               arr << item     
            end
        end
        arr[0].each do |el, val|
            p el
            p val
        end
    end

end

main = Main.new
main.give_name
#main.get_info("kenya")
# main.scraper.start
# print main.get_info("total")

