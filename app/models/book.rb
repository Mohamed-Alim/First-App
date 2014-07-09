class Book < ActiveRecord::Base
	def create
    @book = Book.new(book_params)
  end

  private
  def book_params
    params.require(:book).permit(:Name)
  end
  validates :name, :presence => true
	belongs_to :Author
	belongs_to :Library
end
