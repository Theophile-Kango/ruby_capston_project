# rubocop:disable all
require_relative './scraper'

module Lita
  module Handlers
    class CoronaInfo < Handler
      reg = Scraper.new
      reg.start
      exp = "/"+reg.get_regex.to_s+"/i"
      exp = Regexp.new exp
      route(exp, :get_info)

      def get_info response
        scraper = Scraper.new
        scraper.start
        scraper.get_info(response)
       end

      Lita.register_handler(self)
    end
  end
end
