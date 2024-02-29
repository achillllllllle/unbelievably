class AddCoordinatesToWonders < ActiveRecord::Migration[7.1]
  def change
    add_column :wonders, :latitude, :float
    add_column :wonders, :longitude, :float
  end
end
