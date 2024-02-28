class AddLongDescriptionToWonders < ActiveRecord::Migration[7.1]
  def change
    add_column :wonders, :long_description, :text
  end
end
