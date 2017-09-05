class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.job = Job.find(params[:job_id])
    @comment.save
    @company = Company.find(params[:company_id])
    redirect_to company_job_path(@company, @comment.job)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end

end
