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

    respond_to do |format|
      if @karaoke_shop.save
        format.html { redirect_to @karaoke_shop, notice: 'Karaoke shop was successfully created.' }
        format.json { render :show, status: :created, location: @karaoke_shop }
      else
        format.html { render :new }
        format.json { render json: @karaoke_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /karaoke_shops/1
  # PATCH/PUT /karaoke_shops/1.json
  def update
    respond_to do |format|
      if @karaoke_shop.update(karaoke_shop_params)
        format.html { redirect_to @karaoke_shop, notice: 'Karaoke shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @karaoke_shop }
      else
        format.html { render :edit }
        format.json { render json: @karaoke_shop.errors, status: :unprocessable_entity }
      end
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
      params.require(:karaoke_shop).permit(:name, :day_price, :night_price, :dayfree1_price, :nightfree1_price, :open_time, :close_time, :nightstart_time, :dayfree1_start_time, :dayfree1_endtime, :nightfree1_start_time, :nightfree1_endtime)
    end
end
