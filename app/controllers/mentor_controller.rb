class MentorController < ApplicationController

  def new
      @mentor = Mentor.new
  end

  def create
    mentor_params = params[:mentor].slice(:school, :major, :graduation_year)
                                   .merge(user: current_user, email: current_user.email)

    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      flash[:info] = "Successfully applied as a mentor"
      redirect_to users_path
      #redirect_to root_url
    else
      render 'new'
    end
  end
end
