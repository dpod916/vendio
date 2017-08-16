class ProfilesController < ApplicationController
  before_action :set_owner
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index

  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile.destroy
    respond_to do |format|
        format.js
    end

  end

  # GET /profiles/new
  def new
    @profile = profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = @owner.profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile.profilable, notice: 'profile was successfully created.' }
        format.json
        format.js
      else
        format.html { redirect_to able }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @able, notice: 'profile was successfully updated.' }
        format.json
        format.js
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_owner
    params.each do |key, value|
     # target groups using regular expressions
     if (key.to_s.end_with? '_id')
      model = key.dup.gsub('_id', '').classify.constantize
      @owner = model.find(value)
     end

    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profilable, notice: 'profile was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar_file_name, :avatar_file_size, :avatar_content_type, :avatar, :name, :title, :description, :tagline)
    end


end
