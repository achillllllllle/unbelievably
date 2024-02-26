class AddUserReferenceToWonder < ActiveRecord::Migration[7.1]
  def change
    add_reference :wonders, :user, foreign_key: true
  end
end
