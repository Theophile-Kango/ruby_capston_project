require "nokogiri"
require "httparty"
require "byebug"

class Scraper
    
    def start
        url = "https://www.worldometers.info/coronavirus/"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        
        details = parsed_page.css('td')

        details_array = Array.new(details.length){Hash.new} 
        
        list_arr = ['Country','Total cases','new cases','Total deaths','New deaths',
            'Total recovered','Active Cases','Serious Critical','Total cases/1M pop']

        diff = details_array.length / list_arr.length 
            
        sort_list = Array.new(diff)

        info(list_arr, details,details_array, sort_list)    
        
        byebug

        sort_list
    end

    def converter(big_arr, my_array, value)
        long = my_array.length
        value.length.times do |i|
            value << [big_arr[long*i],big_arr[(long*i)+1],big_arr[(long*i)+2],
            big_arr[(long*i)+3],big_arr[(long*i)+4],big_arr[(long*i)+5],
            big_arr[(long*i)+6],big_arr[(long*i)+7],big_arr[(long*i)+8]
        ]
        end
        value
    end
    

    def info(array, details, details_arr, my_list)
        total = array.length

        total.times do |i|
            details.length.times do |j|
                if j % total == i
                    details_arr[j][array[i]] = details[j].text
                end
            end
        end
        converter(details_arr, array, my_list)
    end
end
