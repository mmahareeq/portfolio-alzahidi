class Admin::BannersController < ApplicationController
  before_action :set_admin_banner, only: %i[ show edit update destroy ]

  # GET /admin/banners or /admin/banners.json
  def index
    @admin_banners = Admin::Banner.all
  end

  # GET /admin/banners/1 or /admin/banners/1.json
  def show
  end

  # GET /admin/banners/new
  def new
    @admin_banner = Admin::Banner.new
  end

  # GET /admin/banners/1/edit
  def edit
  end

  # POST /admin/banners or /admin/banners.json
  def create
    @admin_banner = Admin::Banner.new(admin_banner_params)

    respond_to do |format|
      if @admin_banner.save
        format.html { redirect_to admin_banner_url(@admin_banner), notice: "Banner was successfully created." }
        format.json { render :show, status: :created, location: @admin_banner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/banners/1 or /admin/banners/1.json
  def update
    respond_to do |format|
      if @admin_banner.update(admin_banner_params)
        format.html { redirect_to admin_banner_url(@admin_banner), notice: "Banner was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_banner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/banners/1 or /admin/banners/1.json
  def destroy
    @admin_banner.destroy!

    respond_to do |format|
      format.html { redirect_to admin_banners_url, notice: "Banner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_banner
      @admin_banner = Admin::Banner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_banner_params
      params.require(:admin_banner).permit(:name, :link, :image)
    end
end
