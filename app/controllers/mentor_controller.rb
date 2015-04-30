class MentorController < ApplicationController


  def new
      @mentor=Mentor.new
  end

  def create
    @mentor=Mentor.new
    @user = User.find(session[:user_id])
    @mentor.user=@user
    @mentor.email=@user.email
    @mentor.school= params[:mentor][:school]
    @mentor.major = params[:mentor][:major]
    @mentor.graduation_year = params[:mentor][:graduation_year]
    if @mentor.save
      flash[:info] = "Successfully applied"
      redirect_to root_url
    else
      render 'new'
    end
  end
end
