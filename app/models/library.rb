class Library < ActiveRecord::Base
	def create
    @library = Library.new(library_params)
  end

  private
  def library_params
    params.require(:library).permit(:Name)
  end
  validates :Name, :presence => true
	has_many :Books
end
