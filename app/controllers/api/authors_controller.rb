class Api::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :destroy, :update]
 
  def index
   render json: Author.all
  end

  def show
      #   author = Author.find(params[:id])
      puts'return author json'
    render json: @author
  end

  def destroy
      # author = Author.find(params[:bad_name])
      render json: @author.destroy
  end

  def create
    a = Author.new(author_params)
    if(a.save)
      render json: a
    else
      render json: {errors:  a.errors.full_messages}, status:422
    end
  end

  def update
      if(@author.update(author_params))
        render json: @author
      else
        render json: {errors:  @author.errors.full_messages}, status:422
      end
    end

  private 

  def set_author
      puts'set author'
      @author = Author.find(params[:id])
  end

  def author_params
      params.require(:author).permit(:name, :age)
  end
end