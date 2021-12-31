module PostsHelper
  # Here what we're doing is creating the helper method to assign a post to a user
  def assign_post_creator(post, creator)
    post.user = creator
    post
  end
end
