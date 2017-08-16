class CreateComment
  include Troupe

  expects :params, :user

  provides :comment do
    Comment.new(params)
  end

  def call
    context.fail!(error: comment.errors) unless comment.save      
  end

  after do
    comment.create_activity(
      action: :create,
      owner: user, 
      recipient: recipient
    ) if context.success?
  end

  def recipient 
    comment.parent_id.nil? ? comment.commentable : comment.parent 
  end
end