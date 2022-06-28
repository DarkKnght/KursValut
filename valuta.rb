require 'uri'
require 'net/http'
require 'rexml/document'

if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__

    [STDIN, STDOUT]. each do |io|
        io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end
#массив строк для облачности, описанный на сайте метеосервиса
puts "За какое число вы хотите узнать курс, введите в формате ДД/ММ/ГГГГ"
date = STDIN.gets.chomp
#адрес запроса с сайта метеосервиса
url = "https://cbr.ru/scripts/XML_daily.asp?date_req=#{date}"
uri = URI.parse(url)
#отправляем  HTTP - запрос по указанному адресу и записываем ответ в переменную
#response
response = Net::HTTP.get_response(uri)
#из тела ответа (body) формируем XML документ с помощью REXML парсера
doc = REXML::Document.new(response.body)
doc.each_element('//Valute[@ID="R01235" or @ID="R01239" or @ID="R01375"]') do | item |
    name = item.get_text("Name")
    value = item.get_text("Value").to_s.gsub(',', '.').to_f.round(2)
    puts "#{name}: #{value} руб."
end