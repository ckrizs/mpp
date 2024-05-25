namespace :parse do
  desc 'Parse hospital data from a webpage and save them to the database'
  task :hospitals => :environment do
    require 'open-uri'
    require 'nokogiri'

    # URL, який будемо парсити
    url = "https://hospitals.webometrics.info/en/world"

    class Hospital < ApplicationRecord
    end

    begin
      # Отримання HTML-сторінки з включенням агента користувача в заголовки запиту
      html = URI.open(url, 'User-Agent' => 'ruby').read

      # Парсинг HTML за допомогою Nokogiri
      doc = Nokogiri::HTML(html)

      doc.css('table tr').each do |hospital_row|
        columns = hospital_row.css('td')
        next if columns.empty? # Пропустити рядок заголовків

        rank = columns[0].text.strip.to_i
        name = columns[1].text.strip
        size = columns[3].text.strip.to_i
        visibility = columns[4].text.strip.to_i
        rich_files = columns[5].text.strip.to_i
        scholar = columns[6].text.strip.to_i

        # Виведення інформації про лікарню для дебагу
        puts "Rank: #{rank}, Name: #{name}, Size: #{size}, Visibility: #{visibility}, Rich Files: #{rich_files}, Scholar: #{scholar}"

        # Зберігання даних у базі даних
        hospital = Hospital.new(rank: rank, name: name, size: size, visibility: visibility, rich_files: rich_files, scholar: scholar)
        hospital.save

        puts "Hospital data parsed and saved successfully."
      rescue => e
        puts "Error: #{e.message}"
      end
    end
  end
end