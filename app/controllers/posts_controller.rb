class PostsController < ApplicationController
  
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :home
  # before_action :authenticate_user!, except: [ :index, :show]
  load_and_authorize_resource

  PUBLISHED = "published"
  UNPUBLISHED = "unpublished"

  # GET /posts or /posts.json
  def index
    puts params
    # @post_type= params[:post_type]
    # @q = Post.ransack(params[:q])
    @post_type= params[:post_type]

    if(params[:status].present? )
      @status = params[:status ]
    else
      @status = [PUBLISHED, UNPUBLISHED]
    end

    @status_options = [["All", ""], ["Published", "published"], ["Unpublished", "unpublished"]]
    if @post_type
      if(!user_signed_in? || (user_signed_in? && current_user.authority == 'visitor'))
        @posts = Post.where(post_type: @post_type, status: PUBLISHED)
      else
        @posts = Post.where(post_type: @post_type, status: @status)
      end
      set_meta_tags title: t("global.navbar.#{@post_type}")
    end
  end
  
  # Get Home 
  def home
    @products_posts = Post.where(post_type: "products", status: PUBLISHED).limit(3)
    @services_posts = Post.where(post_type: "services" , status: PUBLISHED).limit(3)
    @projects_posts = Post.where(post_type: "projects", status: PUBLISHED).limit(3)
  end

  # GET /posts/1 or /posts/1.json
  def show 
    set_meta_tags title: @post.title_ar
                  
  end

  # GET /posts/new
  def new
    @post_type = params[:post_type]
    @post = Post.new
    render
  end

  # GET /posts/1/edit
  def edit
    @post_type = params[:post_type]
    @post = Post.find_by(id: params[:id])   
  end

  # POST /posts or /posts.json
  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.status = UNPUBLISHED
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(id: @post.id), notice: I18n.t("global.post.post_created_successfully")}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.status = UNPUBLISHED
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: I18n.t("global.post.post_updated_success" )}
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    post_type = @post.post_type
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url(post_type: post_type), notice: I18n.t("global.post.post_destroy_message") }
      format.json { head :no_content }
    end
  end 

  def change_status
    @post = set_post
    if @post.update(status: params[:status])
      redirect_to post_url(@post), notice: I18n.t("global.post.change_post_status_success")
    else
      redirect_to post_url(@post), alert: I18n.t("global.post.change_post_status_failed")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title_ar, :title_en, :content_ar, :content_en, :post_type, :status, :image)
    end
end
