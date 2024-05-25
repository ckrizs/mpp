class RemoveAllDataFromTableName < ActiveRecord::Migration[7.1]
  def up
    Hospital.delete_all
    Hospital.reset_column_information
  end

  def down
    # This is intentionally left blank
  end
end
