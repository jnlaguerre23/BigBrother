class AddUserIdToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :user_id, :integer
  end
end
