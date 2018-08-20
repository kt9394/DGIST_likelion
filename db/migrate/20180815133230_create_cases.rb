class CreateCases < ActiveRecord::Migration[5.1]
  def change
    create_table :cases do |t|
      t.integer :total_asset
      t.integer :marriage_year
      t.integer :separation_period_year
      t.integer :separation_period_month
      t.integer :agreement
      t.integer :parental_status
      t.string :title
      t.text :abstract
      t.string :url

      t.timestamps
    end
  end
end
