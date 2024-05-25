class AddNameToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :name, :string
  end
end
