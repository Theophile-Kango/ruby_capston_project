#!/usr/bin/ruby

require 'mysql2'
require_relative './scraper'

begin
@db_host = "localhost"
@db_user = "root"
@db_pass = "admin"
@db_name = "corona_db"

# con = Mysql2::Client.new(:username => @db_user, :password => @db_pass,
#         :host => @db_host, :database => @db_name)

    scraper = Scraper.new
    scraper.start
    scraper.principales_titles.each do |item|
    delete_ws = item.split(',').join('').delete(' ').delete('/')
    #     con.query("CREATE TABLE IF NOT EXISTS \ 
    #         corona_info(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, #{delete_wh} VARCHAR(50))")
        #scraper.converter.each do |val| 
            #odd = scraper.converte.each_with_index { |_, i| i.odd? }
            #even = item.select.each_with_index { |_, i| i.odd? }
            #odd = scraper.converter[1].each_index.select {|i| i.odd?}
            
            
            #con.query("INSERT INTO Writers(Name) VALUES('Jack London')")
                  
        #end 
      
      
        
           
            
                #delete_ws = odd.split(',').join('').delete(' ').delete('/')
            
        
        
    end 
    
    #scraper.converter.each do |element|
        
    
    delete_ws = []
    diff = scraper.database_conv.length/scraper.principales_titles.length
    for item in scraper.principales_titles do
        delete_ws << item.split(',').join('').delete(' ').delete('/')
        
        #p "INSERT INTO corona_info(#{delete_ws}) VALUES(' #{scraper.database_conv} ')"
    end  
    #for item in scraper.principales_titles do  
       
      # p "#{delete_ws} and #{scraper.database_conv}"
    
    #end  
        
        # even.each do |el|
        #     delete_ws << el.split(',').join('').delete(' ').delete('/')
        # end
        # scraper.converter.each do |item| 
        #     p "INSERT INTO corona_info(#{item}) VALUES(' #{item} ')"
        # end 
        
    #end
    
        
    # rescue Mysql2::Error => e
    #     puts e.errno
    #     puts e.error
        
    # ensure
    #     con.close if con

    #delete_ws.length.times do |i|
        # diff.length.times do |j|
        #     p "INSERT INTO corona_info(#{delete_ws[0]}) VALUES(' #{scraper.database_conv[0][i]} ')"
        # end
    #end
    # arr_db = []
    
    # scraper.database_conv.length.times do |i|
        
        
    #         arr_db << scraper.database_conv[i]
        
        
       
    # end
    # p scraper.database_conv.length
end






