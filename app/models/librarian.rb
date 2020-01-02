class Librarian
  include ActiveModel::Model

  attr_accessor :username, :password

  def login_valid?
    username == ENV['USERNAME'] && password == ENV['PASSWORD']
  end
end