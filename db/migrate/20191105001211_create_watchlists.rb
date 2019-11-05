class CreateWatchlists < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlists do |t|
      t.string :symbol
    t.integer :user_id

      t.timestamps
    end
  end
end