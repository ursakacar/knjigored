json.extract! book, :id, :internal_number, :title, :is_borrowed, :genre_id, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
