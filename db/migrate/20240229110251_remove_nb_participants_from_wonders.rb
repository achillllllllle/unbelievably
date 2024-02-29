class RemoveNbParticipantsFromWonders < ActiveRecord::Migration[7.1]
  def change
    remove_column :wonders, :nb_participants, :integer
  end
end
