#!/usr/bin/ruby

require 'mysql2'
require_relative './scraper'


def uppercase name 
    mat = /[[:upper:]]/.match(name[1,name.length-1]).to_s
    res = name.include?(mat) ? name.insert(name.index(mat), " ") : name
end

def principales_titles
    url = "https://www.worldometers.info/coronavirus/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    tr = parsed_page.css('tr')
    th = tr.css('th')
    table_header = []
    th.each do |title|
        title = uppercase(title.text.to_s)
        table_header << title
    end
    puts table_header
end

principales_titles
begin
# @db_host = "localhost"
# @db_user = "root"
# @db_pass = "admin"
# @db_name = "corona_db"

# con = Mysql2::Client.new(:username => @db_user, :password => @db_pass,
#         :host => @db_host, :database => @db_name)

#     puts @db_name
    
#     rescue Mysql2::Error => e
#         puts e.errno
#         puts e.error
        
#     ensure
#         con.close if con
    
end






