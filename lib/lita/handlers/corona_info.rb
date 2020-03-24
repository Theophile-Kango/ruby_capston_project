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
          #response.matche( item[1].to_s.downcase.strip) ? response.reply(item) : response.reply("check your country name")         
          unless item[1].match(item[1].to_s.downcase.strip)
            response.reply_privately(item)
          end
        end
      end
     
      Lita.register_handler(self)
    end
  end
end
