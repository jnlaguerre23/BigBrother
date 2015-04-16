class StudentController < ApplicationController



  def new
    @student=Student.new
  end

  def create
    @student=Student.new
    @user = User.find(session[:user_id])
    @student.user=@user
  #  binding.pry
    @student.school= params[:student][:school]
    if @student.save
      flash[:info] = "Successfully applied"
      redirect_to root_url

    else
      render 'new'
    end

end

end
