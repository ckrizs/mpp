class CreatePatientCards < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_cards do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
