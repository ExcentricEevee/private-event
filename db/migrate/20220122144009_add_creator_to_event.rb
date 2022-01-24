class AddCreatorToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :bigint, foreign_key: :true
  end
end
