class StoriesController < ApplicationController

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = current_user.stories.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = current_user.stories.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = current_user.stories.new(params[:story])
    if @story.save
      flash[:success] = "Continder was successfully created."
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = current_user.stories.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:success] = "Continder was successfully updated."
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = current_user.stories.find(params[:id])
    @story.destroy
    flash[:error] = "Continder deleted!"

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end
end
