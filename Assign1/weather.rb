require 'open-uri'
require 'nokogiri'

def read_file	
  File.read("cities.txt")
end

def get_xml(id)
	open("http://weather.yahooapis.com/forecastrss?w=#{id.chomp}&u=f")
end

def parse_xml(raw_xml)
	xml = Nokogiri::XML(raw_xml)
	city = xml.xpath("//yweather:location")
	temperature = xml.xpath("//item//yweather:condition")
  "#{city[0]['city']} \t\t#{city[0]['region']}\t\t#{temperature[0]['temp'].to_i}"
end

def get_result(city_list)
    city_list.map { |woe_id| parse_xml(get_xml(woe_id))}.sort
end

def show_result(weather)  
  puts "City \t\t\tState \t\tTemperature "
  weather.each {|info| puts info}
end

woe_id_list = read_file.split(",")
result = get_result(woe_id_list)
show_result(result)

