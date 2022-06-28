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
#puts "За какое число вы хотите узнать курс, введите в формате ДД/ММ/ГГГГ"
#date = STDIN.gets.chomp
#адрес запроса с сайта метеосервиса
uri = "http://old.code.mu/exercises/advanced/php/parsing/rabota-s-xml-v-php/1/1.xml."
uri = URI.parse(uri)
#отправляем  HTTP - запрос по указанному адресу и записываем ответ в переменную
#response
response = Net::HTTP.get_response(uri)
#из тела ответа (body) формируем XML документ с помощью REXML парсера
#doc = REXML::Document.new(response.body)
name = user.element['name']
age = user.element['age'].to_s
puts "Это #{name} и ему #{age} лет"
