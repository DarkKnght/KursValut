require 'open-uri'
require 'nokogiri'
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

doc = Nokogiri::Slop(URI.open("http://old.code.mu/exercises/advanced/php/parsing/rabota-s-xml-v-php/2/1.xml"))
doc.css('user').each do |link| 
  puts link.content.gsub(/\s+/, "\n").strip
end
puts 
doc.css('@age').each do |item|
 puts "ему " + item.content + " лет " 
end
doc.css('@salary').each do |unit|
  puts  "Он  получает " + unit.content + " руб."   
end
