module Lita
  module Handlers
    class CoronaInfo < Handler
      # insert handler code here
      route(/hello/i, :hellowrod)
      def hellowrod(response)
        response.reply("hello, how are you?")
      end
      Lita.register_handler(self)
    end
  end
end
