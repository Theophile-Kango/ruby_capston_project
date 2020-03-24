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
        #route(item[1].to_s.downcase.strip, command: true) do |response| 
        route(item[1].matches, command: true) do |response| 
            response.reply_privately(item)
        end
      end
     
      Lita.register_handler(self)
    end
  end
end
