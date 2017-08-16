class AttachmentsController < ApplicationController
  before_action :set_owner
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index

  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show

  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json

  def create
    @attachment = @owner.attachments.new(attachment_params)
    @attachment.user = current_user
    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment.attachable, notice: 'Attachment was successfully created.' }
        format.json { render 'attachment.js.erb', locals: {attachment: @attachment, item: @owner } }
        format.js { render :attachment, locals: {attachment: @attachment, item: @owner } }
      else
        format.html { redirect_to able }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
        format.js { render :attachment, locals: {attachment: @attachment, item: @owner } }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @able, notice: 'Attachment was successfully updated.' }
        format.json { render 'attachment.js.erb', locals: {attachment: @attachment, item: @owner } }
        format.js { render :attachment, locals: {attachment: @attachment, item: @owner } }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
        format.js { render :attachment, locals: {attachment: @attachment, item: @owner } }
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

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachable, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:file_file_name, :file_file_size, :file_content_type, :file)
    end


end
