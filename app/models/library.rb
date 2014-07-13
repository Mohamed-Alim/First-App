class Library < ActiveRecord::Base
	def create
    @library = Library.new(library_params)
  end

  private
  def library_params
    params.require(:library).permit(:Name)
  end
  validates :name, :presence => true
  has_many :books
end
