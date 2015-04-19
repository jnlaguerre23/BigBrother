class AddNationalityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :nationality, :string
  end
end
