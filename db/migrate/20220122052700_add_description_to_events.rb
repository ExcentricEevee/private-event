class AddDescriptionToEvents < ActiveRecord::Migration[6.1]
  def change
    change_table :events do |t|
      t.string :description
    end
  end
end
