class PagesController < ApplicationController
  def home
  end

  def recent
    @stories = Story.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: @stories }
    end
  end

  def about
  end

  def contact
  end
end
