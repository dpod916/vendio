class WorkOrdersController < AgreementsController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]
  before_action :set_agreement

  # GET /work_orders
  # GET /work_orders.json
  def index
    @work_orders = set_work_orders
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
    @tabs = {"amendments" => ["tab-1", "active", "tab-pane active","#tab-1", true],
            "contacts" => ["tab-2", "", "tab-pane","#tab-2", false],
            "comments" => ["tab-3", "", "tab-pane","#tab-3", false],  
            "tasks" => ["tab-4", "", "tab-pane","#tab-4", false], 
            "issues" => ["tab-5", "", "tab-pane","#tab-5", false]}
    @issues = Issue.where(issuable_type: "WorkOrder", issuable_id: @work_order.id)
    @tasks = Task.where(taskable_type: "WorkOrder", taskable_id: @work_order.id)
  end

  # GET /work_orders/new
  def new
    @work_order = @agreement.work_orders.new
  end

  # GET /work_orders/1/edit
  def edit
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @agreement = Agreement.find(params[:agreement_id])
    @work_order = @agreement.work_orders.new(work_order_params)
    # @work_order.parent_id = @agreement.id
    respond_to do |format|
      if @work_order.save!
        format.html { redirect_to [@agreement, @work_order], notice: 'Work order was successfully created.' }
        format.json { render :show, status: :created, location: @work_order }
      else
        format.html { render :new }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_orders/1
  # PATCH/PUT /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        format.html { redirect_to [@agreement, @work_order], notice: 'Work order was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_order }
      else
        format.html { render :edit }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @work_order.destroy
    respond_to do |format|
      format.html { redirect_to work_orders_url, notice: 'Work order was successfully destroyed.' }
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

  def all_work_orders
    WorkOrder.includes(:agreement)
             .includes(:agreement_party => [:company, :vendor])
             .includes(:vendor)
             .includes(:company)
             .all
  end

  def owner_work_orders
    owner.work_orders.includes(:agreement)
                     .includes(:agreement_party => [:company, :vendor])
                     .includes(:vendor)
                     .includes(:company)
  end

  def agreement_work_orders
    @agreement.work_orders.includes(:agreement)
                          .includes(:agreement_party => [:company, :vendor])
                          .includes(:vendor)
                          .includes(:company)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def set_work_orders
      @agreement.nil? ? owner.nil? ? all_work_orders : owner_work_orders : agreement_work_orders
    end

    def set_agreement
      @agreement = params[:agreement_id].nil? ? nil : Agreement.find(params[:agreement_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_order_params
      params.require(type.underscore.to_sym).permit(:title, :user_tokens, 
                                            :contact_tokens, :description, :status_id,  
                                            :start_date, :due_date, :user_id, :priority_id)
                                            

    end
end
