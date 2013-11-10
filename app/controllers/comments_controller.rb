class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_ticket
  
  def create 
    @comment = @ticket.comments.build(params[:comment].merge(user: current_user))
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@ticket.project, @ticket]
    else
      flash[:alert] = "Comment has not been created. Text can't be blank."
      redirect_to [@ticket.project, @ticket] 
    end
  end
  
  private
  
  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end