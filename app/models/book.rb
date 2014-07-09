class Book < ActiveRecord::Base
	def create
     @book = Book.new(book_params)
   end

   private
   def book_params
     params.require(:books).permit(:Name)
   end
  validates :name, :presence => true
	belongs_to :author
	belongs_to :library
end
