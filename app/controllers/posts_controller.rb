class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelist_post_params)

    if @post.save
      flash[:Success] = "Thanks for submitting your water issue."
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])

    if @post.update(whitelist_post_params)
      flash[:Success] = "Your water issue has been updated."
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:Notice] = "Your water issue has been deleted."
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def whitelist_post_params
    params.require(:post).permit(:issue, :name, :comment)
  end

end
