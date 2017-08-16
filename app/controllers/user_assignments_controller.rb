class UserAssignmentsController < ApplicationController
  before_action :set_user_assignment, only: [:show, :edit, :update, :destroy]

  # GET /user_assignments
  # GET /user_assignments.json
  def index
    @user_assignments = UserAssignment.all
  end

  # GET /user_assignments/1
  # GET /user_assignments/1.json
  def show
  end

  # GET /user_assignments/new
  def new
    @user_assignment = UserAssignment.new
  end

  # GET /user_assignments/1/edit
  def edit
  end

  # POST /user_assignments
  # POST /user_assignments.json
  def create
    @user_assignment = UserAssignment.new(user_assignment_params)

    respond_to do |format|
      if @user_assignment.save
        format.html { redirect_to @user_assignment, notice: 'User assignment was successfully created.' }
        format.json { render :show, status: :created, location: @user_assignment }
      else
        format.html { render :new }
        format.json { render json: @user_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = @user_assignment.user
    @item = @user_assignment.assignable
    @user_assignment.update_attributes(role: params[:role].capitalize)
    respond_to do |format|
      format.js { render :role, locals: {user: @user, item: @item, assignment: @user_assignment, element: "##{@user_assignment.dash_param.downcase}_roles" } }
    end
  end

  # DELETE /user_assignments/1
  # DELETE /user_assignments/1.json
  def destroy
    @user_assignment.destroy
    respond_to do |format|
      format.html { redirect_to user_assignments_url, notice: 'User assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def item
      i = params[:item].split('-')
      item = i[0].classify.constantize.find(i[1])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user_assignment
      @user_assignment = UserAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_assignment_params
      params.require(:user_assignment).permit(:user_id, :assignable_id, :role, :accepted)
    end
end
