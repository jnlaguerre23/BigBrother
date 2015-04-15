class StudentController < ApplicationController



  def new
    @student=Student.new
  end

  def create
    @student = User.find(params[:id])

    if @student.save
      flash[:info] = "Successfully applied"
      redirect_to @student

    else
      render 'new'
    end


  
end
