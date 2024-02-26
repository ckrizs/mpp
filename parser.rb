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

table = doc.at('table')

if table
  CSV.open('hospitals_data.csv', 'w') do |csv|
    csv << ['Rank', 'Hospital', 'Country', 'City', 'State']

    table.css('tbody tr').each do |row|
      rank, hospital, country, city, state = row.css('td').map(&:text)
      hospital_name = row.at('td:nth-child(2) a').text

      state = state.empty? ? '-' : state

      csv << [rank, hospital_name, country, city, state]
    end
  end

  puts 'Данные успешно извлечены и записаны в hospitals_data.csv'
else
  puts 'Таблица не найдена на странице.'
end