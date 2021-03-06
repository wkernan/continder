class StoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  # GET /stories
  # GET /stories.json
  def recent
    @stories = Story.order('created_at DESC')

    respond_to do |format|
      format.html
      format.json { render json: @stories }
    end
  end

  def index
    @stories = Story.paginate(:page => params[:page], :per_page => 5).find_with_reputation(:votes, :all, order: "votes desc")

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
    @story = current_user.stories.find(params[:id]) rescue redirect_to(root_path)
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = current_user.stories.new(params[:story])
    if @story.save
      flash[:success] = "Continder was successfully created."
      redirect_to recent_path
    else
      flash[:danger] = "Something went wrong."
      redirect_to root_path
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:success] = "Continder was successfully updated."
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong."
      redirect_to root_path
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id]).destroy
    flash[:info] = "Continder deleted!"
    redirect_to root_path
  end

  def vote
    begin
      value = params[:type] == "up" ? 1 : -1
      @story = Story.find(params[:id])
      @story.add_evaluation(:votes, value, current_user)
      flash[:success] = "Thank you for voting!"
      redirect_to :back
    rescue ActiveRecord::RecordInvalid
      redirect_to :back
      flash[:danger] = "You have already voted for this continder"
    end
  end
end
