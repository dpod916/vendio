class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    # commentable = @comment.commentable
    # @comment.destroy
    # redirect_to commentable
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end


  def create
    create_comment = CreateComment.call(user: current_user, params: comment_params)
    if create_comment.success?
      redirect_to create_comment.comment, notice: 'Comment was successfully created.'
    end
  end

  # def create
  #   @item_able = able_type.find(params[:comment][:commentable_id])
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     unless @comment.parent_id.nil?
  #       @parent_comment = Comment.find(@comment.parent_id)
  #       # @parent_comment.notify :appliaction_users, key: "comment.reply"
  #     end
  #     if @comment.commentable_type.include?("PublicActivity")
  #         redirect_to @item_able.owner
  #     else
  #         redirect_to @item_able
  #     end
  #   end
  # end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update!(comment_params)
        format.html { redirect_to @comment.commentable }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { redirect_to @able }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    commentable = @comment.commentable
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to commentable, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reply
    respond_to do |format|
      format.js
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :parent_id, :commentable_type, :commentable_id)
    end

end
