class SessionsController < ApplicationController
  def new
    @librarian = Librarian.new
  end

  def create
    # sleep 2 # you can add sleep here  if you want to  slow down brute force attack
              # for normal application this is bad idea but for one
              # user login no-one care

    librarian_params = params.require(:librarian)

    @librarian = Librarian.new
      .tap { |su| su.username = librarian_params[:username] }
      .tap { |su| su.password = librarian_params[:password] }

    if @librarian.login_valid?
      session[:current_user] = true
      redirect_back(fallback_location: '/')
    else
      @librarian.password = nil
      flash[:notice] = 'Napačno uporabniško ime ali geslo'
      render 'new'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end