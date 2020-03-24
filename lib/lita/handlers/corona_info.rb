# rubocop:disable all
require_relative './scraper'

module Lita
  module Handlers
    class CoronaInfo < Handler
      attr_reader :scraper

      scraper = Scraper.new
      scraper.start
      scraper.converter
      
      scraper.converter.each do |item| 
        route(item[1].to_s.downcase.strip, command: true) do |response|
          
          #response.reply("Give me a country name and I will give you back corona info about the country")
            
            response.reply(item)
         # else
            #response.reply("I don't find the country")
          #end
        end
      end
      Lita.register_handler(self)
    end
  end
end
