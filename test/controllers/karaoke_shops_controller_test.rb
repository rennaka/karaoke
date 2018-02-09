require 'test_helper'

class KaraokeShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @karaoke_shop = karaoke_shops(:one)
  end

  test "should get index" do
    get karaoke_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_karaoke_shop_url
    assert_response :success
  end

  test "should create karaoke_shop" do
    assert_difference('KaraokeShop.count') do
      post karaoke_shops_url, params: { karaoke_shop: { close_time: @karaoke_shop.close_time, day_price: @karaoke_shop.day_price, dayfree1_endtime: @karaoke_shop.dayfree1_endtime, dayfree1_price: @karaoke_shop.dayfree1_price, dayfree1_start_time: @karaoke_shop.dayfree1_start_time, name: @karaoke_shop.name, night_price: @karaoke_shop.night_price, nightfree1_endtime: @karaoke_shop.nightfree1_endtime, nightfree1_price: @karaoke_shop.nightfree1_price, nightfree1_start_time: @karaoke_shop.nightfree1_start_time, nightstart_time: @karaoke_shop.nightstart_time, open_time: @karaoke_shop.open_time } }
    end

    assert_redirected_to karaoke_shop_url(KaraokeShop.last)
  end

  test "should show karaoke_shop" do
    get karaoke_shop_url(@karaoke_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_karaoke_shop_url(@karaoke_shop)
    assert_response :success
  end

  test "should update karaoke_shop" do
    patch karaoke_shop_url(@karaoke_shop), params: { karaoke_shop: { close_time: @karaoke_shop.close_time, day_price: @karaoke_shop.day_price, dayfree1_endtime: @karaoke_shop.dayfree1_endtime, dayfree1_price: @karaoke_shop.dayfree1_price, dayfree1_start_time: @karaoke_shop.dayfree1_start_time, name: @karaoke_shop.name, night_price: @karaoke_shop.night_price, nightfree1_endtime: @karaoke_shop.nightfree1_endtime, nightfree1_price: @karaoke_shop.nightfree1_price, nightfree1_start_time: @karaoke_shop.nightfree1_start_time, nightstart_time: @karaoke_shop.nightstart_time, open_time: @karaoke_shop.open_time } }
    assert_redirected_to karaoke_shop_url(@karaoke_shop)
  end

  test "should destroy karaoke_shop" do
    assert_difference('KaraokeShop.count', -1) do
      delete karaoke_shop_url(@karaoke_shop)
    end

    assert_redirected_to karaoke_shops_url
  end
end
