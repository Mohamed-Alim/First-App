class Author < ActiveRecord::Base 
	def create
    @author = Author.new(author_params)
  end

  private
  def author_params
    params.require(:author).permit(:Name)
  end
  validates :name, :presence => true
  has_many :Books
end
