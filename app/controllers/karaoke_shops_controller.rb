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
        @karaoke_shop.create_member_price_datum(member_price_data_params)
        @karaoke_shop.create_freetime_datum(freetime_data_params)

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

    def member_price_data_params
      params.require(:member_price_data).permit(:weekday_day_price, :holiday_day_price, :weekday_night_price, :holiday_night_price, :weekday_dayfree1_price, :holiday_dayfree1_price, :weekday_nightfree1_price, :holiday_nightfree1_price, :weekday_dayfree2_price, :holiday_dayfree2_price, :weekday_nightfree2_price, :holiday_nightfree2_price)
    end

    def freetime_data_params
      { weekday_dayfree1_starttime: OnlyTime.set_times(params[:freetime_data][:weekday_dayfree1_starttime],params[:freetime_data][:weekday_dayfree1_endtime])[:former], weekday_dayfree1_endtime: OnlyTime.set_times(params[:freetime_data][:weekday_dayfree1_starttime],params[:freetime_data][:weekday_dayfree1_endtime])[:latter], weekday_dayfree1_limittime: params[:freetime_data][:weekday_dayfree1_limittime],
        weekday_nightfree1_starttime: OnlyTime.set_times(params[:freetime_data][:weekday_nightfree1_starttime],params[:freetime_data][:weekday_nightfree1_endtime])[:former], weekday_nightfree1_endtime: OnlyTime.set_times(params[:freetime_data][:weekday_nightfree1_starttime],params[:freetime_data][:weekday_nightfree1_endtime])[:latter], weekday_nightfree1_limittime: params[:freetime_data][:weekday_nightfree1_limittime],
        holiday_dayfree1_starttime: OnlyTime.set_times(params[:freetime_data][:holiday_dayfree1_starttime],params[:freetime_data][:holiday_dayfree1_endtime])[:former], holiday_dayfree1_endtime: OnlyTime.set_times(params[:freetime_data][:holiday_dayfree1_starttime],params[:freetime_data][:holiday_dayfree1_endtime])[:latter], holiday_dayfree1_limittime: params[:freetime_data][:holiday_dayfree1_limittime],
        holiday_nightfree1_starttime: OnlyTime.set_times(params[:freetime_data][:holiday_nightfree1_starttime],params[:freetime_data][:holiday_nightfree1_endtime])[:former], holiday_nightfree1_endtime: OnlyTime.set_times(params[:freetime_data][:holiday_nightfree1_starttime],params[:freetime_data][:holiday_nightfree1_endtime])[:latter], holiday_nightfree1_limittime: params[:freetime_data][:holiday_nightfree1_limittime],
        weekday_dayfree2_starttime: OnlyTime.set_times(params[:freetime_data][:weekday_dayfree2_starttime],params[:freetime_data][:weekday_dayfree2_endtime])[:former], weekday_dayfree2_endtime: OnlyTime.set_times(params[:freetime_data][:weekday_dayfree2_starttime],params[:freetime_data][:weekday_dayfree2_endtime])[:latter], weekday_dayfree2_limittime: params[:freetime_data][:weekday_dayfree2_limittime],
        weekday_nightfree2_starttime: OnlyTime.set_times(params[:freetime_data][:weekday_nightfree2_starttime],params[:freetime_data][:weekday_nightfree2_endtime])[:former], weekday_nightfree2_endtime: OnlyTime.set_times(params[:freetime_data][:weekday_nightfree2_starttime],params[:freetime_data][:weekday_nightfree2_endtime])[:latter], weekday_nightfree2_limittime: params[:freetime_data][:weekday_nightfree2_limittime],
        holiday_dayfree2_starttime: OnlyTime.set_times(params[:freetime_data][:holiday_dayfree2_starttime],params[:freetime_data][:holiday_dayfree2_endtime])[:former], holiday_dayfree2_endtime: OnlyTime.set_times(params[:freetime_data][:holiday_dayfree2_starttime],params[:freetime_data][:holiday_dayfree2_endtime])[:latter], holiday_dayfree2_limittime: params[:freetime_data][:holiday_dayfree2_limittime],
        holiday_nightfree2_starttime: OnlyTime.set_times(params[:freetime_data][:holiday_nightfree2_starttime],params[:freetime_data][:holiday_nightfree2_endtime])[:former], holiday_nightfree2_endtime: OnlyTime.set_times(params[:freetime_data][:holiday_nightfree2_starttime],params[:freetime_data][:holiday_nightfree2_endtime])[:latter], holiday_nightfree2_limittime: params[:freetime_data][:holiday_nightfree2_limittime],
      }
    end

end
