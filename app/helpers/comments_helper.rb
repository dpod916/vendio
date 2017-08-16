module CommentsHelper
  def comments_tree_for(comments)
  	i = 1 
    comments.map do |comment, nested_comments|
      i+=1
      render(partial: "comments/comment", locals: { comment: comment, count: i}) +
          (nested_comments.size > 0 ? content_tag(:div, comments_tree_for(nested_comments), class: "replies") : nil)
    end.join.html_safe
  end

  def social_tree_for(comments)
  	i = 1 
    comments.map do |comment, nested_comments|
      i+=1
      render(partial: "comments/social_comment", locals: { comment: comment, count: i}) +
          (nested_comments.size > 0 ? content_tag(:div, comments_tree_for(nested_comments), class: "replies") : nil)
    end.join.html_safe
  end
end

