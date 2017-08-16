class FollowsController < ApplicationController

  def create
    current_user.follow(item)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js { render :create, locals: {item: item, element: "##{item.dash_param.downcase}_follow_actions" } }
    end
  end

  def destroy
    current_user.stop_following(item)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js { render :create, locals: {item: item, element: "##{item.dash_param.downcase}_follow_actions" } }
    end
  end

  def item
    i = params[:item].split('-')
    item = i[0].classify.constantize.find(i[1])
  end


end