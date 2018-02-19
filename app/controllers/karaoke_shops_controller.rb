class KaraokeShopsController < ApplicationController
  before_action :set_karaoke_shop, only: [:show, :edit, :update, :destroy]

  # GET /karaoke_shops
  # GET /karaoke_shops.json
  def index
    @karaoke_shops = KaraokeShop.all
  end

  # GET /karaoke_shops/1
  # GET /karaoke_shops/1.json
  def show
  end

  # GET /karaoke_shops/new
  def new
    @karaoke_shop = KaraokeShop.new
  end

  # GET /karaoke_shops/1/edit
  def edit
  end

  # POST /karaoke_shops
  # POST /karaoke_shops.json
  def create
    @karaoke_shop = KaraokeShop.new(karaoke_shop_params)
      if @karaoke_shop.save
        redirect_to root_path, notice: 'Karaoke shop was successfully created.'
      else
        render :new
      end
  end

  # DELETE /karaoke_shops/1
  # DELETE /karaoke_shops/1.json
  def destroy
    @karaoke_shop.destroy
    respond_to do |format|
      format.html { redirect_to karaoke_shops_url, notice: 'Karaoke shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_karaoke_shop
      @karaoke_shop = KaraokeShop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def karaoke_shop_params
      params.require(:karaoke_shop).permit(:name, :karaoke_kind_id)
    end
end
