class TerminationsController < ApplicationController
  before_action :set_termination, only: [:show, :edit, :update, :destroy]

  # GET /terminations
  # GET /terminations.json
  def index
    @terminations = Termination.all
  end

  # GET /terminations/1
  # GET /terminations/1.json
  def show
  end

  # GET /terminations/new
  def new
    @termination = Termination.new
  end

  # GET /terminations/1/edit
  def edit
  end

  # POST /terminations
  # POST /terminations.json
  def create
    @termination = Termination.new(termination_params)

    respond_to do |format|
      if @termination.save
        format.html { redirect_to @termination, notice: 'Termination was successfully created.' }
        format.json { render :show, status: :created, location: @termination }
      else
        format.html { render :new }
        format.json { render json: @termination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terminations/1
  # PATCH/PUT /terminations/1.json
  def update
    respond_to do |format|
      if @termination.update(termination_params)
        format.html { redirect_to @termination, notice: 'Termination was successfully updated.' }
        format.json { render :show, status: :ok, location: @termination }
      else
        format.html { render :edit }
        format.json { render json: @termination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terminations/1
  # DELETE /terminations/1.json
  def destroy
    @termination.destroy
    respond_to do |format|
      format.html { redirect_to terminations_url, notice: 'Termination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_termination
      @termination = Termination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def termination_params
      params.fetch(:termination, {})
    end
end
