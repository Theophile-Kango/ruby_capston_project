require "nokogiri"
require "httparty"
require "byebug"

def scraper
    url = "https://www.worldometers.info/coronavirus/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    mount = parsed_page.css('#maincounter-wrap')
    countries = parsed_page.css('#main_table_countries')
    details = parsed_page.css('td').text.to_s.split(" ")

    countries.each do |countrie|
        countrie = {
            title: countrie.css('th').text
        }
        byebug
    end
    
    mount.each do |cases|
        cases = {
            title: cases.css('h1').text,
            number: cases.css('div.maincounter-number').text
        }
        byebug
    end

end

scraper

#"mount = #maincounter-wrap"
#"mount_first = mount.first.text " => Coronavirus cases: 190,929
#mount_first.css('h1').text => Coronavirus cases:
#mount_first.css('div.maincounter-number').text => Coronavirus cases:
#countries = parsed_page.css('#main_table_countries')
#countries.css('td') => Total cases, new cases, Total deaths, New deaths, 
#Total recovered, Activities, Serious Critical, Total cases/1M pop
#countries_name = countries.css('.sorting_1')