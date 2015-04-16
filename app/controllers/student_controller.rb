class StudentController < ApplicationController



  def new
    @student=Student.new
  end

  def create
    @student=Student.new
    @user = User.find(session[:user_id])

    if @student.save
      flash[:info] = "Successfully applied"
      redirect_to users_url

    else
      render 'new'
    end

end

end
