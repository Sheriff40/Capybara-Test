class PostsController < DashboardBaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_path
    else
      flash[:alert] = @post.errors.full_messages
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to posts_path
    else
      flash[:alert] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post was successfully destroyed."
    else
      flash[:alert] = "Post could not be destroyed."
    end
    redirect_back(fallback_location: root_path)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
        
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :price, :hobby ,:gender,:sus_date, :image, foods: [])
    end
end