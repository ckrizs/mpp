# app/models/hospital.rb
class Hospital < ApplicationRecord
  # Інші методи та асоціації

  # Додаємо метод для Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id name rank rich_files scholar size updated_at visibility]
  end
end
