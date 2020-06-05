class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.integer :value
      t.references :client, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
