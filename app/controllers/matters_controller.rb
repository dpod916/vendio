class MattersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_matter, only: [:show, :edit, :update, :destroy, :tasks]

  # GET /matters
  # GET /matters.json
  def index
    items = Matter.includes(:profile)
    respond_to do |format|
      format.html { render "layouts/index", locals: {items: items, items_name: 'matters'}  }
      format.json { render json: @items.tokens(params[:q]) }
    end
  end

  # GET /matters/1
  # GET /matters/1.json
  def show
    @activities = @matter.get_activities
                      .paginate(:page => params[:page], :per_page => 10000)
                      .group_by {|t| t.created_at.to_date }
    respond_to do |format|
      format.html { render "layouts/show_item", locals: {item: @matter}  }
      format.json
    end
  end

  # GET /matters/new
  def new
    @matter = Matter.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  # POST /matters.json
  def create
    @matter = Matter.new(matter_params)

    respond_to do |format|
      if @matter.save
        format.html { redirect_to @matter, notice: 'Matter was successfully created.' }
        format.json { render :show, status: :created, location: @matter }
      else
        format.html { render :new }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matters/1
  # PATCH/PUT /matters/1.json
  def update
    @matter.update_attributes(matter_params)
    respond_to do |format|
      if @matter.update(matter_params)
         format.json { render :json => {:success => true} }
      else
         format.json { render :json => {:success => false} }
      end
    end
  end

  # DELETE /matters/1
  # DELETE /matters/1.json
  def destroy
    @matter.destroy
    respond_to do |format|
      format.html { redirect_to matters_url, notice: 'Matter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter
      @matter = Matter.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_params
      params.require(:matter).permit(:date, :time, :name, :title,
                                     :owner_tokens, :participant_tokens,
                                     :admin_tokens, :contact_tokens,
                                     :subject_tokens, :reviewer_tokens,
                                     :task_tokens)
    end

end
