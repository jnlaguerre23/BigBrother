class StaticPagesController < ApplicationController
  def home
    @hero_template = 'home'
  end

end
