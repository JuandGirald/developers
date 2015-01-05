class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.integer :user_id
      t.string :name
      t.integer :age
      t.string :location
      t.integer :accept_rate
      t.string :website_url
      t.string :link
      t.integer :reputation
      t.integer :reputation_change_year
      t.integer :reputation_change_quarter
      t.integer :reputation_change_month
      t.integer :reputation_change_week
      t.integer :bronze_badges
      t.integer :silver_badges
      t.integer :gold_badges

      t.timestamps
    end
  end
end
