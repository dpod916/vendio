class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

 def index
    @users = User.includes(:profile, {office: :profile}, {function: :profile},
                           {division: :profile}, {profit_center: :profile},
                           {department: :profile}, {business_unit: :profile},
                           {operating_company: :profile})

    respond_to do |format|
      format.html { render 'users/index.html.erb' }
      format.json { render json: @users.tokens(params[:q]) }
    end
 end


  def show
   @activities = @user.get_activities
                      .paginate(:page => params[:page], :per_page => 10000)
                      .group_by {|t| t.created_at.to_date }

    respond_to do |format|
      format.html { render "layouts/show", locals: {item: @user}  }
      format.json
    end
  end

  # GET /users/1/edit
  def edit
  end

  def update
    # update your model
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])

    format.html {
      if request.xhr?
        # *** repond with the new value ***
        render :text => params[:user].values.first
      else
        redirect_to(@user, :notice => 'User was successfully updated.')
      end
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.includes(:company, :profit_center,
                            :division, :segment, :department,
                            :function, :business_unit)
                            .find(params[:id])
    end

    def item
      i = params[:item].split('-')
      item = i[0].classify.constantize.find(i[1])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:description, :avatar, avatar_attributes: [])
    end
end
