class Post < ActiveRecord::Base

	validates :user_id, presence: true

	belongs_to :user

	default_scope order: 'posts.created_at DESC'
	def create
    Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
end
