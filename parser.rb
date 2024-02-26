require 'nokogiri'
require 'net/http'
require 'uri'
require 'csv'

url = 'https://www.newsweek.com/rankings/worlds-best-hospitals-2023'
headers = {'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'}

uri = URI.parse(url)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = (uri.scheme == 'https')

request = Net::HTTP::Get.new(uri.request_uri, headers)

response = http.request(request)

html = response.body

doc = Nokogiri::HTML(html)

# Найти таблицу на странице (подставьте свой собственный селектор)
table = doc.at('table')

# Проверить, что таблица найдена
if table
  # Создать CSV-файл для записи данных
  CSV.open('hospitals_data.csv', 'w') do |csv|
    # Записать заголовки
    csv << ['Rank', 'Hospital', 'Country', 'City', 'State']

    # Пройти по строкам таблицы
    table.css('tbody tr').each do |row|
      # Извлечь текст из каждой ячейки (td) и записать в CSV
      rank, hospital, country, city, state = row.css('td').map(&:text)
      hospital_name = row.at('td:nth-child(2) a').text # Извлечь название больницы из второй ячейки

      # Добавить прочерк, если штат отсутствует
      state = state.empty? ? '-' : state

      csv << [rank, hospital_name, country, city, state]
    end
  end

  puts 'Данные успешно извлечены и записаны в hospitals_data.csv'
else
  puts 'Таблица не найдена на странице.'
end