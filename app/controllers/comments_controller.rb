class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_ticket
  
  def create 
    unless current_user.admin?
      if cannot?(:"change states", @ticket.project) 
        params[:comment].delete(:state_id)
      end
    end
    @comment = @ticket.comments.build(params[:comment].merge(user: current_user))
    if @comment.save
      if can?(:tag, @ticket.project) || current_user.admin?
        @ticket.tag!(params[:tags])
      end
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
