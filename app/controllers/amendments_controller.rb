class AmendmentsController < AgreementsController
  before_action :set_amendment, only: [:show, :edit, :update, :destroy]
  before_action :set_agreement

  # GET /amendments
  # GET /amendments.json
  def index
    @amendments = @agreement.nil? ? owner.nil? ? Amendment.all : owner.amendments : @agreement.amendments
  end

  # GET /amendments/1
  # GET /amendments/1.json
  def show
    @tabs = {"contacts" => ["tab-1", "active", "tab-pane active","#tab-1", true],
            "comments" => ["tab-2", "", "tab-pane","#tab-2", false],
            "tasks" => ["tab-3", "", "tab-pane","#tab-3", false],  
            "issues" => ["tab-4", "", "tab-pane","#tab-4", false]}
    @issues = Issue.where(issuable_type: "Amendment", issuable_id: @amendment.id)
    @tasks = Task.where(taskable_type: "Amendment", taskable_id: @amendment.id)

    respond_to do |format|
      format.html { render "#{type.pluralize.underscore}/show.html.erb" }
      format.json { render json: Staff.tokens(params[:q]) }
    end
  end


  # GET /amendments/new
  def new
    @amendment = @agreement.amendments.new
  end

  # GET /amendments/1/edit
  def edit
  end

  # POST /amendments
  # POST /amendments.json
  def create
    @amendment = @agreement.amendments.new(amendment_params)
    # @amendment.parent_id = @agreement.id
    respond_to do |format|
      if @amendment.save!
        format.html { redirect_to [@agreement, @amendment], notice: 'Work order was successfully created.' }
        format.json { render :show, status: :created, location: @amendment }
      else
        format.html { render :new }
        format.json { render json: @amendment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amendments/1
  # PATCH/PUT /amendments/1.json
  def update
    respond_to do |format|
      if @amendment.update(amendment_params)
        format.html { redirect_to [@agreement, @amendment], notice: 'Work order was successfully updated.' }
        format.json { render :show, status: :ok, location: @amendment }
      else
        format.html { render :edit }
        format.json { render json: @amendment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amendments/1
  # DELETE /amendments/1.json
  def destroy
    @amendment.destroy
    respond_to do |format|
      format.html { redirect_to amendments_url, notice: 'Work order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def owner_id
    owner_id = nil
    owner_id = params[:user_id] unless params[:user_id].nil? 
    owner_id = params[:staff_id] unless params[:staff_id].nil?
    owner_id = params[:company_id] unless params[:company_id].nil?
    owner_id = params[:vendor_id] unless params[:vendor_id].nil?
    return owner_id
  end

  def owner_model
    owner_model = nil
    owner_model = "User" unless params[:user_id].nil? 
    owner_model = "User" unless params[:staff_id].nil?
    owner_model = "Company" unless params[:company_id].nil?
    owner_model = "Vendor" unless params[:vendor_id].nil?
    return owner_model.classify.constantize
  end

  def owner
    owner_id.nil? ? nil : owner_model.find(owner_id)
  end

  def type_class
    type.classify.constantize
  end

  def type 
    params[:type].nil? ? 'Amendment' : params[:type]
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amendment
      @amendment = Amendment.find(params[:id])
    end

    def set_agreement
      @agreement = params[:agreement_id].nil? ? nil : Agreement.find(params[:agreement_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amendment_params
      params.require(type.underscore.to_sym).permit(:title, :user_tokens, 
                                            :contact_tokens, :description, :status_id,  
                                            :start_date, :due_date, :user_id, :priority_id)
                                            

    end
end
