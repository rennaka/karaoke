class FrontsController < ApplicationController

  def top
  end

  def calc_price_form
  end

  def karaoke_map
    @karaoke_shops = KaraokeShop.where(karaoke_kind_id: 3)
  end

  def map_search
    
  end

  def result
    return @all_display_data = [] if start_time == end_time
    shops = KaraokeShop.where(karaoke_kind_id: params[:kind]&.values).map { |shop| shop.object(params[:date],start_time,end_time) }
    @all_display_data = shops.map {|shop| shop.display_data_list}.flatten.select{|display_data| display_data.charge > 0}
  end

  def edit
  end

  def create
    respond_to do |format|
      if @front.save
        format.html { redirect_to @front, notice: 'Front was successfully created.' }
        format.json { render :show, status: :created, location: @front }
      else
        format.html { render :new }
        format.json { render json: @front.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @front.update(front_params)
        format.html { redirect_to @front, notice: 'Front was successfully updated.' }
        format.json { render :show, status: :ok, location: @front }
      else
        format.html { render :edit }
        format.json { render json: @front.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @front.destroy
    respond_to do |format|
      format.html { redirect_to fronts_url, notice: 'Front was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def start_time
    OnlyTime.freetime(params[:start_time],params[:end_time])[:starttime]
  end

  def end_time
    OnlyTime.freetime(params[:start_time],params[:end_time])[:endtime]
  end
end
