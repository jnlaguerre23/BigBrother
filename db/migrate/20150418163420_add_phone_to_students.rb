class AddPhoneToStudents < ActiveRecord::Migration
  def change
    add_column :students, :phone, :integer
  end
end
