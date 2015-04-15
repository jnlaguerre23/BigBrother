class AddSchoolToStudent < ActiveRecord::Migration
  def change
    add_column :students, :school, :string
  end
end
