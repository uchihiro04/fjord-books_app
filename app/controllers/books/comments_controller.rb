class Books::CommentsController <  CommentsController
  before_action :set_commentable, only: %i[create]
  before_action :set_render_template, only: %i[create]

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_render_template
    @render_template = 'books/show'
    @book = Book.find(params[:book_id])
  end
end
