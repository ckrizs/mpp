class AddConfirmableToPatients < ActiveRecord::Migration[7.1]
  def change
    change_table :patients, bulk: true do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
    add_index  :patients, :confirmation_token, unique: true
  end
end
