class FrontsController < ApplicationController
  before_action :set_shops, only: [:result]

  def top
  end

  def result
    @shops.each do |shop|
      binding.pry
    end
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
    def set_shops
      @shops = KaraokeShop.all.map { |shop| shop.object(params[:date],start_time,end_time) }
    end

    def start_time
      OnlyTime.set(params[:start_time]["start_time(4i)"],params[:start_time]["start_time(5i)"])
    end

    def end_time
      tmp_end_time = OnlyTime.set(params[:end_time]["end_time(4i)"],params[:end_time]["end_time(5i)"])
      tmp_end_time < start_time ? tmp_end_time + 1.days : tmp_end_time
    end
end
