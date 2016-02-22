class PostsController < ApplicationController
  
  def index
    if params[:query].present?
      @posts = Post.entitled(params[:query])
    else
      @posts = Post.all
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    
    # if Post.valid?
    #   Post.create({
    #     title: params[:post][:title],
    #     content: params[:post][:content],
    #     author: params[:post][:author],
    #     category: params[:post][:category]
    #   })

    #   redirect_to root_path
    # else
    #   error_message = @post.errors.messages
    #   render error_message
    # end

  	Post.create({
  		title: params[:post][:title],
  		content: params[:post][:content],
  		author: params[:post][:author],
  		category: params[:post][:category]
  	})

  	# redirect_to root_path
  	# render text: params
  end

  # /posts/:id -> params[:id]
  def edit
    @post = Post.find(params[:id])

  end
  def post_params
    params.require(:post).permit(:title, :author, :content, :category)
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path

    # if @post.valid?
    #   @post.update(post_params)
    #   redirect_to root_path
    # else
    #   error_message = @post.errors.messages
    #   render error_message
    # end
    
  end

  # def search
  #   @posts = Post.entitled(params[:query])
  #   # render the view index (above), but only render the posts filtered
  #   render :index
  # end

end
