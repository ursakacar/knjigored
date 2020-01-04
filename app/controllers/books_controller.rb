class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required!, only: [:create, :new, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @raw_query_param = params[:query]
    where_query = "
      REPLACE(REPLACE(REPLACE(REPLACE(LOWER(books.title), 'č', 'c'), 'š', 's'), 'ž', 'z'), ' ', '') LIKE :query OR
      REPLACE(REPLACE(REPLACE(REPLACE(LOWER(authors.name), 'č', 'c'), 'š', 's'), 'ž', 'z'), ' ', '') LIKE :query OR
      REPLACE(REPLACE(REPLACE(REPLACE(LOWER(genres.name), 'č', 'c'), 'š', 's'), 'ž', 'z'), ' ', '') LIKE :query
    "
    query_param = @raw_query_param.delete(' ').downcase.gsub('č', 'c').gsub('š', 's').gsub('ž', 'z') rescue ''

    if is_int? @raw_query_param
      where_query = where_query + "OR books.internal_number = :raw_query"
    end 

    @books = Book.all
      .left_joins(:author, :genre)
      .where(
        where_query,
        {
          query: "%#{query_param}%",
          raw_query: @raw_query_param,
        }
      )
      .order(:title)
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @raw_author_name = @book.author.name
  end

  # POST /books
  # POST /books.json
  def create
    @raw_author_name = params.require(:book)[:author_name]
    author_name = @raw_author_name.delete(' ').downcase.gsub('č', 'c').gsub('š', 's').gsub('ž', 'z') rescue ''
    where_query = "REPLACE(REPLACE(REPLACE(REPLACE(LOWER(authors.name), 'č', 'c'), 'š', 's'), 'ž', 'z'), ' ', '') = :author_name"

    authors = Author.where(
      where_query,
      { author_name: author_name }
    )

    if authors.size == 0
      new_author = Author.new(name: @raw_author_name)
      if new_author.save
        author_id = new_author.id
      else
        author_id = nil
      end
    else
      author_id = authors[0].id
    end

    @book = Book.new(book_params.merge(:author_id => author_id))

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Knjiga uspešno ustvarjena.' }
        format.json { render :show, status: :created, location: @book }
      else
        if new_author
          new_author.destroy!
        end

        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Knjiga uspešno posodobljena.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Knjiga uspešno izbrisana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def is_int?(str)
      !!Integer(str)
    rescue ArgumentError, TypeError
      false
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:internal_number, :title, :is_borrowed, :genre_id)
    end
end
