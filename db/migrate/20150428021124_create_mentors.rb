class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :school
      t.string :major
      t.string :graduation_year
      t.string :email
      
      t.timestamps null: false
    end
  end
end
