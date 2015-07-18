class StudentController < ApplicationController


  def new
    @student = Student.new
  end

  def create
    student_params = params[:student].slice(:nationality, :phone, :grade, :gpa,
                                            :school).merge(user: current_user)

    @student = Student.new(student_params)

    if @student.save
      flash[:info] = "Successfully applied"
      redirect_to root_url
    else
      render 'new'
    end
  end
end
