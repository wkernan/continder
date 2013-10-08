class PagesController < ApplicationController
  def home
  end
  def recent
    @stories = Story.order("created_at desc")

    respond_to do |format|
      format.html
      format.json { render json: @stories }
    end
  end
end
