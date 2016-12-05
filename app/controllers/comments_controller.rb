class CommentsController < ApplicationController
  
  
  # POST /comments
  # POST /comments.json
  def create
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.build(comment_params)
    @comment.user = current_user
    @comment.save

    redirect_to lecture_path(@lecture)
    #redirect_to lecture_url()

  end

  
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.find(params[:id]).destroy
    
    redirect_to lecture_path(@lecture)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
