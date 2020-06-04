class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.string :description
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :enabled, default: true
      t.boolean :premium, default: false

      t.timestamps
    end
    add_index :offers, :advertiser_name, unique: true
  end
end
