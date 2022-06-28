require 'open-uri'
require 'nokogiri'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
doc = Nokogiri::HTML(URI.open("http://old.code.mu/exercises/advanced/php/parsing/rabota-s-xml-v-php/4/1.xml")) 
doc.search('//user').each do |link|
puts link.content.gsub(/\s+/, "\n\t").strip

end


