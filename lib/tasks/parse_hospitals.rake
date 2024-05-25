namespace :parse do
  desc 'Parse hospital data from a webpage and save them to the database'
  task :hospitals => :environment do
    require 'open-uri'
    require 'nokogiri'

    # URL, який будемо парсити
    url = "https://www.newsweek.com/rankings/worlds-best-hospitals-2023"

    begin
      # Отримання HTML-сторінки з включенням агента користувача в заголовки запиту
      html = URI.open(url, 'User-Agent' => 'ruby').read

      # Парсинг HTML за допомогою Nokogiri
      doc = Nokogiri::HTML(html)

      # Отримання даних про лікарні та їх збереження у базі даних
      doc.css('.rankings-list-item').each do |hospital_node|
        name = hospital_node.css('.rankings-list-hospital-name').text.strip
        country = hospital_node.css('.rankings-list-country').text.strip
        city = hospital_node.css('.rankings-list-city').text.strip
        rank = hospital_node.css('.rankings-list-hospital-rank').text.strip.to_i

        # Зберігання даних у базі даних
        Hospital.create(name: name, country: country, city: city, rank: rank)
      end

      puts "Hospital data parsed and saved successfully."
    rescue => e
      puts "Error: #{e.message}"
    end
  end
end
