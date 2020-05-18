
#!/usr/bin/ruby
require 'json'
require 'httparty'

class Connect

  attr_reader :obj, :global, :date, :countries
  
  def initialize
    url = 'https://api.covid19api.com/summary'
    response = HTTParty.get(url)
    obj = response.parsed_response
    @global = obj["Global"]
    @date = obj["Date"]
    @countries = obj["Countries"]
  end

  def uppercase(name)
    mat = /[[:upper:]]/.match(name[1, name.length - 1]).to_s
    name.include?(mat) ? name.insert(name.index(mat), ' ') : name
  end
  
end

con = Connect.new
con.countries
