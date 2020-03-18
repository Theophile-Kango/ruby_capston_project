require_relative './scraper'

module Lita
  module Handlers
    class CoronaInfo < Handler
      
      route(/china/i, :get_info)
      def get_info(response)
        scrapper = Scraper.new
        scrapper.get_sort_list.each do |element|
          if element[0]["Country"].downcase.strip == response.downcase.strip
            response.reply(" Country : #{element[0]["Country"]}\n 
            total cases : #{element[1]["Total cases"]}\n
            new cases : #{element[2]["new cases"]}\n  
            total death : #{element[3]["Total deaths"]}\n
            new deaths : #{element[4]["New death"]}\n 
            total recovered : #{element[5]["Total recovered"]}\n
            active cases : #{element[6]["Active Cases"]}\n 
            serious cirtical : #{element[7]["Serious Critical"]}\n
            total cases/1M pop : #{element[8]["Total cases/1M pop"]} ")
            break
        end
    end
end
      def hellowrod(response)
        response.reply("hello #{response.user}, how are you?")
      end

      Lita.register_handler(self)
    end
  end
end
