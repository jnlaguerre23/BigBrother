class StudentController < ApplicationController

  def new
    @student=Student.new
  end

  def create
    @student=Student.new
    @user = User.find(session[:user_id])
    @student.user=@user
    @student.school= params[:student][:school]
    @student.phone = params[:student][:phone]
    @student.grade = params[:student][:grade]
    @student.gpa = params[:student][:gpa]
    @student.nationality = params[:student][:nationality]
    if @student.save
      flash[:info] = "Successfully applied"
      redirect_to root_url
    else
      render 'new'
    end

  end
end
