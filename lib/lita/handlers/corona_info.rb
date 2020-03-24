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
          #request = item[1].split(",") 
          response.matches ? response.reply(item) : response.reply("check your country name")         
        end
      end
     
      Lita.register_handler(self)
    end
  end
end
