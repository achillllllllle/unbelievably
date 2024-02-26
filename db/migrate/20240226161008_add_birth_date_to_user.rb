class AddBirthDateToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :birth_date, :date
  end
end
