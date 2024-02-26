class AddContentToWonder < ActiveRecord::Migration[7.1]
  def change
    add_column :wonders, :content, :text
  end
end
