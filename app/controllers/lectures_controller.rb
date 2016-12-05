class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!
  before_action :lecture_owner, only: [:edit, :update, :destroy]
  before_action :index_redirect, only: [:index]

  def upvote
    @lecture.upvote_from current_user
    redirect_to lecture_path(@lecture)
    
  end
  def downvote
    @lecture.downvote_from current_user
    redirect_to lecture_path(@lecture)
    
  end

  def download 
    my_file = Lecture.find(params[:id]).attached_file.path
    send_file my_file
  end

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)
    #@lecture.course_id=current_course.id
    

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:title, :content, :attached_file, :course_id)
    end

    def lecture_owner
       @lecture = Lecture.find(params[:id])
       if current_user.instructor
        if current_user != @lecture.course.user
          redirect_to lecture_path(@lecture)
        end
       end
    end
    def index_redirect
      redirect_to courses_path()
    end
end
