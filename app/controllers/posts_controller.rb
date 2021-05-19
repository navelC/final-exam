class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
<<<<<<< HEAD
    if params[:category]
      @category = Category.find_by_name(params[:category])
      @pagy, @posts = pagy(Post.joins(:brand).where("brands.category_id =" +@category.id.to_s), items: 5)
    else 
      @pagy, @posts = pagy(Post.all, items: 5)
    end
=======
    @posts = Post.all
>>>>>>> upstream/master
  end

  # GET /posts/1 or /posts/1.json
  def category_selection
    @brands = Brand.where(category_id: params[:id])
    respond_to do |format|
       format.js {  }
    end
  end

  def province_selection
    @districts = District.where(province_id: params[:id])
    respond_to do |format|
       format.js {  }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new()
<<<<<<< HEAD
    @category_id = Category.all.first;
    @province_id = Province.all.first;
=======
>>>>>>> upstream/master
  end

  def payment

  end

  # GET /posts/1/edit
  def edit
<<<<<<< HEAD
    @post = Post.find(params[:id])
    @category_id = Category.joins(:brands).find_by("brands.id = "+@post.brand_id.to_s).id
    @province_id = Province.joins(:districts).find_by("districts.id = "+@post.district_id.to_s).id
=======
>>>>>>> upstream/master
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      @post[:status] = 'chưa duyệt'
      if @post.save
        format.html { redirect_to new_post_path, success: "Bạn đã đăng bài thàng công" }
        format.json { render :show, status: :created, location: @post }
      else
<<<<<<< HEAD
        format.html { render :new, info: "tin đăng thất bại" }
=======
        format.html { render :new, status: :unprocessable_entity }
>>>>>>> upstream/master
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
<<<<<<< HEAD
      params.require(:post).permit(:title, :address, :status, :price,:user_id, :brand_id, :descript, :district_id, :image,:category_id)
=======
      params.require(:post).permit(:title, :address, :status, :price,:user_id, :brand_id, :descript, :district_id, :image)
>>>>>>> upstream/master
    end
end
