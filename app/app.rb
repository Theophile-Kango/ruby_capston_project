require_relative '../bin/main'
require_relative '../lib/sort'
require 'telegram_bot'

require 'telegram/bot'

class App
  attr_accessor :sort, :token, :result, :main, :kb
  def initialize
    @sort = Sort.new
    @result = []
    @token = ENV['API_KEY']
    @main = Main.new
    @kb = []
  end

  def start
    Telegram::Bot::Client.run(@token) do
      bot = TelegramBot.new(@token)
      bot.get_updates(fail_silently: true) do |message|
        command = message.get_command_for(bot)
        message.reply do |reply|
          case command
          when /start/i
            reply.text = "#{message.text.capitalize}, #{message.from.first_name}  🤖!"
            reply.text = "I'm here to give you corona info check with /help command what you can do."
          when /help/i
            reply.text = 'We sorted countries in alphabetic order, choose one letter on your keyboard to begin'
          when /^[A-Z]+$/i
            bot_replies
          else
            reply.text = "I have no idea what #{command.inspect} means."
          end
          reply.send_with(bot)
        end
      end
    end
  end

  def bot_replies
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message
        when Telegram::Bot::Types::CallbackQuery
          @result.each do |element|
            next unless message.data == element do
              @main.scraper.start
              bot.api.send_message(chat_id: message.from.id, text: @main.get_info(element))
            end
          end
        when Telegram::Bot::Types::Message
          @sort.countries_sort(message.text.upcase).each do |element|
            @result << element
            @kb << Telegram::Bot::Types::InlineKeyboardButton.new(text: element, callback_data: element)
          end
          markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: @kb)
          bot.api.send_message(chat_id: message.chat.id, text: 'Choose a country', reply_markup: markup)
        end
      end
    end
  end
end

app = App.new
app.start
