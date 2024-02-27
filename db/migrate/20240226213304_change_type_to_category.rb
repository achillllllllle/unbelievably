class ChangeTypeToCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :wonders, :type, :category
  end
end
